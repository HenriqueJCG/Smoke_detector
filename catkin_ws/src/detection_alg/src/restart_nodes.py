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

class KissManager:

    def __init__(self): 
        self.running = False
        self.proc = None
        self.last_pose_msg = None
        self.path = Path()

        rospy.Subscriber("/point_ratio", Float64, self.callback)
        rospy.Subscriber("/odometry/filtered", Odometry, self.pose_callback)

        self.mode = rospy.get_param("~mode")
      
        if self.mode == "livox":
            self.topic = "/filtered_livox"
        else:
            self.topic = "/filtered_ouster"

        self.path_pub = rospy.Publisher("ekf_trajectory",   Path, queue_size=10)
            
        self.stop_threshold = rospy.get_param("~stop_lidar_threshold", 0.15)
        self.start_threshold = rospy.get_param("~start_lidar_threshold", 0.70)
        rospy.on_shutdown(self.stop_kiss)


    def pose_callback(self, msg):
        self.last_pose_msg = msg
        
        pose = PoseStamped()
        pose.header = msg.header
        pose.pose = msg.pose.pose

        self.path.header = msg.header
        self.path.poses.append(pose)

        self.path_pub.publish(self.path)

    def start_kiss(self):
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

        if self.last_pose_msg is not None:
            rospy.wait_for_service("/set_pose")

            set_pose = rospy.ServiceProxy("/set_pose", SetPose)

            msg = PoseWithCovarianceStamped()
            msg.header = self.last_pose_msg.header
            msg.pose = self.last_pose_msg.pose

            msg.pose.covariance = [0.0] * 36
            msg.pose.covariance[0] = 0.05    # x variance
            msg.pose.covariance[7] = 0.05    # y variance
            msg.pose.covariance[14] = 0.05   # z variance
            msg.pose.covariance[21] = 0.05   # roll
            msg.pose.covariance[28] = 0.05   # pitch
            msg.pose.covariance[35] = 0.05   # yaw

            set_pose(msg)

        self.running = True

    def stop_kiss(self):
        if not self.running:
            return
    
        self.proc.kill()
        self.proc.wait()

        self.running = False

    def callback(self, msg):

        if msg.data <= self.stop_threshold:
            self.stop_kiss()

        elif msg.data >= self.start_threshold:
            self.start_kiss()


if __name__ == "__main__":
    rospy.init_node("kiss_manager")

    manager = KissManager()

    manager.start_kiss()

    rospy.spin()