#!/usr/bin/env python
import numpy as np
import rospy
import sensor_msgs.point_cloud2 as pc2
from sensor_msgs.msg import PointCloud2, PointField, Imu
from geometry_msgs.msg import TwistWithCovarianceStamped
from nav_msgs.msg import Odometry
from std_msgs.msg import Header


class RadarEgoVelocity:

    def __init__(self):
        
        self.doppler_field = rospy.get_param("~doppler_field", "doppler")
        self.min_points = rospy.get_param("~min_points", 10)
        self.ransac_iterations = rospy.get_param("~ransac_iterations", 17)
        self.inlier_threshold = rospy.get_param("~inlier_threshold", 0.15)  # m/s residual
        self.publish_filtered_cloud = rospy.get_param("~publish_filtered_cloud", False)
        self.integrate_position = rospy.get_param("~integrate_position", True)
 
        self.last_time = None
        self.position = np.array([
            rospy.get_param("/radar_ego_velocity/initial_x", 0.0),
            rospy.get_param("/radar_ego_velocity/initial_y", 0.0),
            rospy.get_param("/radar_ego_velocity/initial_z", 0.0),
        ])

        self.last_imu_quat = (
            rospy.get_param("/radar_ego_velocity/initial_qx", 0.0),
            rospy.get_param("/radar_ego_velocity/initial_qy", 0.0),
            rospy.get_param("/radar_ego_velocity/initial_qz", 0.0),
            rospy.get_param("/radar_ego_velocity/initial_qw", 1.0),
        )

        
        self.mode = rospy.get_param("~mode","ouster")
      
        if self.mode == 'livox':
            rospy.Subscriber("/radar_enhanced_pcl2", PointCloud2, self.cloud_callback, queue_size=1)
        else:
            rospy.Subscriber("/hugin_raf_1/radar_data", PointCloud2, self.cloud_callback, queue_size=1)
        


        if self.integrate_position:
            rospy.Subscriber("/imu/data", Imu, self.imu_callback, queue_size=10)

        self.twist_pub = rospy.Publisher("/radar/ego_velocity", TwistWithCovarianceStamped, queue_size=10)

        if self.integrate_position:
            self.odom_pub = rospy.Publisher("/radar/odometry_dead_reckoned", Odometry, queue_size=10)
        
        if self.publish_filtered_cloud:
            self.filtered_pub = rospy.Publisher("/radar/dynamic_removed", PointCloud2, queue_size=1)

    def imu_callback(self, msg):
        q = msg.orientation
        self.last_imu_quat = (q.x, q.y, q.z, q.w)

    def cloud_callback(self, msg):
        points = list(
            pc2.read_points(msg, field_names=("x", "y", "z", self.doppler_field), skip_nans=True)
        )
        if len(points) < self.min_points:
            rospy.logwarn_throttle(
                5.0, "Radar ego-velocity: not enough points (%d) this scan", len(points)
            )
            return

        xyz = np.array([[p[0], p[1], p[2]] for p in points])
        doppler = np.array([p[3] for p in points])

        ranges = np.linalg.norm(xyz, axis=1)
        valid = ranges > 1e-3 
        xyz, doppler, ranges = xyz[valid], doppler[valid], ranges[valid]
        if len(xyz) < self.min_points:
            return

        directions = xyz / ranges[:, None]  

        velocity, inlier_mask = self.ransac_ego_velocity(directions, doppler)
        if velocity is not None:
            velocity = np.array([
                velocity[1],   
                -velocity[0],  
                velocity[2]
            ])

        self.publish_twist(velocity, msg.header)

        if self.integrate_position:
            self.integrate_and_publish(velocity, msg.header)

        if self.publish_filtered_cloud:
            self.publish_filtered(msg, points, valid, inlier_mask)

    def ransac_ego_velocity(self, directions, doppler):
        
        n = len(directions)
        if n < 3:
            return None, None

        best_inliers = None
        best_count = 0
        rng = np.random.default_rng()

        for _ in range(self.ransac_iterations):
            sample_idx = rng.choice(n, size=3, replace=False)
            H_sample = directions[sample_idx]
            d_sample = doppler[sample_idx]

            # H . v = -doppler  =>  v = lstsq(H, -doppler)
            try:
                v_candidate = np.linalg.lstsq(H_sample, -d_sample, rcond=None)[0]
            except np.linalg.LinAlgError:
                continue

            predicted = -directions @ v_candidate
            residuals = np.abs(doppler - predicted)
            inliers = residuals < self.inlier_threshold
            count = int(np.sum(inliers))

            if count > best_count:
                best_count = count
                best_inliers = inliers

        if best_inliers is None or best_count < self.min_points:
            return None, None

        H_in = directions[best_inliers]
        d_in = doppler[best_inliers]
        velocity = np.linalg.lstsq(H_in, -d_in, rcond=None)[0]
        velocity = np.array([
            velocity[0],
            velocity[1],
            0.0
        ])  

        return velocity, best_inliers

    def publish_twist(self, velocity, header):
        msg = TwistWithCovarianceStamped()
        msg.header = header
        msg.twist.twist.linear.x = velocity[0]
        msg.twist.twist.linear.y = velocity[1]
        msg.twist.twist.linear.z = velocity[2]
        
        cov = [0.0] * 36
        cov[0] = cov[7] = cov[14] = 0.05 
        msg.twist.covariance = cov
        self.twist_pub.publish(msg)

    def integrate_and_publish(self, velocity, header):
        now = header.stamp.to_sec()
        if self.last_time is None:
            self.last_time = now
            return
        dt = now - self.last_time
        self.last_time = now
        if dt <= 0 or dt > 1.0:
            return  

        if self.last_imu_quat is not None:
            world_velocity = self.rotate_by_quat(velocity, self.last_imu_quat)
        else:
            
            world_velocity = velocity

        self.position += world_velocity * dt

        odom = Odometry()
        odom.header = header
        odom.header.frame_id = "odom"
        odom.child_frame_id = "radar"
        odom.pose.pose.position.x = self.position[0]
        odom.pose.pose.position.y = self.position[1]
        odom.pose.pose.position.z = self.position[2]
        if self.last_imu_quat is not None:
            odom.pose.pose.orientation.x = self.last_imu_quat[0]
            odom.pose.pose.orientation.y = self.last_imu_quat[1]
            odom.pose.pose.orientation.z = self.last_imu_quat[2]
            odom.pose.pose.orientation.w = self.last_imu_quat[3]
        else:
            odom.pose.pose.orientation.w = 1.0
        odom.twist.twist.linear.x = velocity[0]
        odom.twist.twist.linear.y = velocity[1]
        odom.twist.twist.linear.z = velocity[2]

        # Fixed diagonal covariance for position (x, y, z) in the pose estimate
        pose_cov = [0.0] * 36
        pose_cov[0] = pose_cov[7] = pose_cov[14] = 0.05
        odom.pose.covariance = pose_cov

        self.odom_pub.publish(odom)

    @staticmethod
    def rotate_by_quat(v, q):
        
        x, y, z, w = q
        qv = np.array([x, y, z])
        t = 2.0 * np.cross(qv, v)
        return v + w * t + np.cross(qv, t)

    def publish_filtered(self, original_msg, points, valid_mask, inlier_mask):
        
        valid_points = [p for p, v in zip(points, valid_mask) if v]
        kept = [p for p, keep in zip(valid_points, inlier_mask) if keep]

        fields = [
            PointField(name="x", offset=0, datatype=PointField.FLOAT32, count=1),
            PointField(name="y", offset=4, datatype=PointField.FLOAT32, count=1),
            PointField(name="z", offset=8, datatype=PointField.FLOAT32, count=1),
            PointField(name=self.doppler_field, offset=12, datatype=PointField.FLOAT32, count=1),
        ]
        header = Header()
        header.stamp = original_msg.header.stamp
        header.frame_id = original_msg.header.frame_id
        filtered_cloud = pc2.create_cloud(header, fields, kept)
        self.filtered_pub.publish(filtered_cloud)


if __name__ == "__main__":
    rospy.init_node("radar_ego_velocity")
    RadarEgoVelocity()
    rospy.spin()