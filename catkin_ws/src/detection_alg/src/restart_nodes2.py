#!/usr/bin/env python
import signal
import subprocess
import rospy
from std_msgs.msg import Float64
from nav_msgs.msg import Odometry, Path
from geometry_msgs.msg import PoseStamped
from robot_localization.srv import SetPose
from geometry_msgs.msg import PoseWithCovarianceStamped
from sensor_msgs.msg import PointCloud2, PointCloud

class Manager:

    def __init__(self): 
        self.running = True
        self.proc = None
        self.proc2 = None
        self.last_pose_msg = None
        self.path = Path()

        rospy.Subscriber("/point_ratio", Float64, self.callback)
        rospy.Subscriber("/odometry/filtered", Odometry, self.pose_callback)
        rospy.Subscriber("/kiss/odometry", Odometry, self.radar_pose_callback)
        rospy.Subscriber("/genz/odometry", Odometry, self.lidar_pose_callback)
        rospy.Subscriber("/radar/odometry_dead_reckoned", Odometry, self.ego_pose_callback)


        self.mode = rospy.get_param("~mode")
      
        if self.mode == "livox":
            self.topic = "/filtered_livox"
            self.topic2 = "/filtered_oculii"
        else:
            self.topic = "/filtered_ouster"
            self.topic2 = "/filtered_hugin"

        self.path_pub = rospy.Publisher("ekf_trajectory",   Path, queue_size=10)
            
        self.stop_threshold = rospy.get_param("~stop_lidar_threshold", 0.10)
        self.start_threshold = rospy.get_param("~start_lidar_threshold", 0.6)
        rospy.on_shutdown(self.stop_lidar)
        rospy.on_shutdown(self.stop_radar)


    def pose_callback(self, msg):
        
        pose = PoseStamped()
        pose.header = msg.header
        pose.pose = msg.pose.pose

        self.path.header = msg.header
        self.path.poses.append(pose)

        self.path_pub.publish(self.path)

    def radar_pose_callback(self, msg):
        self.last_pose_msg = msg

    def lidar_pose_callback(self, msg):
        self.last_pose_msg = msg

    def ego_pose_callback(self, msg):
        self.last_pose_msg = msg


    def start_lidar(self):
        if self.running and self.proc is not None and self.proc.poll() is None:
            return

        if self.last_pose_msg is None:

            rospy.set_param("/genz_icp/initial_pose_x", 0.0)
            rospy.set_param("/genz_icp/initial_pose_y", 0.0)
            rospy.set_param("/genz_icp/initial_pose_z", 0.0)

            rospy.set_param("/genz_icp/initial_pose_qx", 0.0)
            rospy.set_param("/genz_icp/initial_pose_qy", 0.0)
            rospy.set_param("/genz_icp/initial_pose_qz", 0.0)
            rospy.set_param("/genz_icp/initial_pose_qw", 1.0)
        else:
            pose = self.last_pose_msg.pose.pose

            rospy.set_param("/genz_icp/initial_pose_x", pose.position.x)
            rospy.set_param("/genz_icp/initial_pose_y", pose.position.y)
            rospy.set_param("/genz_icp/initial_pose_z", pose.position.z)

            rospy.set_param("/genz_icp/initial_pose_qx", pose.orientation.x)
            rospy.set_param("/genz_icp/initial_pose_qy", pose.orientation.y)
            rospy.set_param("/genz_icp/initial_pose_qz", pose.orientation.z)
            rospy.set_param("/genz_icp/initial_pose_qw", pose.orientation.w)

        self.proc = subprocess.Popen([
            "roslaunch",
            "genz_icp",
            "odometry.launch",
            f"topic:={self.topic}"
        ])

        

        self.running = True

    def stop_lidar(self):
        if self.proc is not None and self.proc.poll() is None:
            self.proc.kill()
            self.proc.wait()
            self.proc = None
        else:
            return

        self.running = False



    def start_radar(self):
        if not self.running and self.proc2 is not None and self.proc2.poll() is None:
            return
        if self.mode == "ouster":
            if self.last_pose_msg is None:
                rospy.set_param("/radar_ego_velocity/initial_x", 0.0)
                rospy.set_param("/radar_ego_velocity/initial_y", 0.0)
                rospy.set_param("/radar_ego_velocity/initial_z", 0.0)
                rospy.set_param("/radar_ego_velocity/initial_qx", 0.0)
                rospy.set_param("/radar_ego_velocity/initial_qy", 0.0)
                rospy.set_param("/radar_ego_velocity/initial_qz", 0.0)
                rospy.set_param("/radar_ego_velocity/initial_qw", 1.0)
            else:
                pose = self.last_pose_msg.pose.pose
                rospy.set_param("/radar_ego_velocity/initial_x", pose.position.x)
                rospy.set_param("/radar_ego_velocity/initial_y", pose.position.y)
                rospy.set_param("/radar_ego_velocity/initial_z", pose.position.z)
                rospy.set_param("/radar_ego_velocity/initial_qx", pose.orientation.x)
                rospy.set_param("/radar_ego_velocity/initial_qy", pose.orientation.y)
                rospy.set_param("/radar_ego_velocity/initial_qz", pose.orientation.z)
                rospy.set_param("/radar_ego_velocity/initial_qw", pose.orientation.w)


            self.proc2 = subprocess.Popen(
                ["rosrun", "detection_alg", "egovelocity.py"],
            )

        else:
            if self.last_pose_msg is None:

                rospy.set_param("/kiss_icp/initial_pose_x", 0.0)
                rospy.set_param("/kiss_icp/initial_pose_y", 0.0)
                rospy.set_param("/kiss_icp/initial_pose_z", 0.0)

                rospy.set_param("/kiss_icp/initial_pose_qx", 0.0)
                rospy.set_param("/kiss_icp/initial_pose_qy", 0.0)
                rospy.set_param("/kiss_icp/initial_pose_qz", 0.0)
                rospy.set_param("/kiss_icp/initial_pose_qw", 1.0)
            else:
                pose = self.last_pose_msg.pose.pose

                rospy.set_param("/kiss_icp/initial_pose_x", pose.position.x)
                rospy.set_param("/kiss_icp/initial_pose_y", pose.position.y)
                rospy.set_param("/kiss_icp/initial_pose_z", pose.position.z)

                rospy.set_param("/kiss_icp/initial_pose_qx", pose.orientation.x)
                rospy.set_param("/kiss_icp/initial_pose_qy", pose.orientation.y)
                rospy.set_param("/kiss_icp/initial_pose_qz", pose.orientation.z)
                rospy.set_param("/kiss_icp/initial_pose_qw", pose.orientation.w)

            self.proc2 = subprocess.Popen([
                "roslaunch",
                "kiss_icp",
                "odometry.launch",
                f"topic:={self.topic2}"
            ])        

        self.running = False

    def stop_radar(self):
        if self.proc2 is not None and self.proc2.poll() is None:
            self.proc2.kill()
            self.proc2.wait()
            self.proc2 = None
        else:
            return

        self.running = True

    def callback(self, msg):

        if msg.data <= self.stop_threshold:
            self.stop_lidar()
            self.start_radar()

        elif msg.data >= self.start_threshold:
            self.stop_radar()
            self.start_lidar()


if __name__ == "__main__":
    rospy.init_node("manager")

    manager = Manager()

    manager.start_lidar()
    manager.stop_radar()

    rospy.spin()