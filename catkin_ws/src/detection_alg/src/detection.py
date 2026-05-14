#!/usr/bin/env python
import rospy
import math, csv
from sensor_msgs.msg import PointCloud2,PointCloud
from std_msgs.msg import Float64
import sensor_msgs.point_cloud2 as pc2
from livox_ros_driver.msg import CustomMsg

class Point_Ratio:
    def __init__(self):
        rospy.init_node("point_ratio")

        self.radar_points = 1
        self.lidar_points = 1
        self.max_points = 1


        self._lidar_ratio = self.lidar_points / self.max_points
        self._sensor_ratio = self.lidar_points / self.radar_points

        self.mode = rospy.get_param("~mode")
        
        if self.mode == 'livox':
            rospy.Subscriber("/radar_enhanced_pcl", PointCloud, self.radar_callback)
            rospy.Subscriber("/livox/lidar", CustomMsg, self.lidar_callback)
        else:
            #rospy.Subscriber("/ouster/points", PointCloud2, self.lidar_callback)
            #rospy.Subscriber("/oculii_radar/point_cloud", PointCloud2, self.radar_callback)
            rospy.Subscriber("/hugin_raf_1/radar_data", PointCloud2, self.radar_callback)
            rospy.Subscriber("/ouster/points", PointCloud2, self.lidar_callback)



        self.pub = rospy.Publisher("point_ratio", Float64, queue_size=10)
        self.pub_lidar = rospy.Publisher("lidar_points", Float64, queue_size=10)
        self.pub_radar = rospy.Publisher("radar_points", Float64, queue_size=10)

        self.rate = rospy.Rate(10)


    def probability(self):
        self._lidar_ratio = self.lidar_points / self.max_points
        self._sensor_ratio = (self.lidar_points)/ (self.radar_points )

        self.pub.publish(self._sensor_ratio)
        self.pub_lidar.publish(self.lidar_points)   
        self.pub_radar.publish(self.radar_points)

    def radar_callback(self, msg):

        if self.mode == 'livox':
            self.radar_points = len(msg.points)
        else:
            self.radar_points = msg.width * msg.height

        self.probability()

    def lidar_callback(self, msg):
        if self.mode == 'livox':
            self.lidar_points = 1
            for p in msg.points:
                if p.reflectivity > 0:
                    self.lidar_points += 1
            self.max_points = msg.point_num

        else:
            self.lidar_points = sum( 1 for p in pc2.read_points(msg, field_names=("x","y","z")) if not (p[0] == 0 and p[1] == 0 and p[2] == 0))
            self.max_points = msg.width * msg.height
    
        self.probability()

if __name__ == "__main__":
    node = Point_Ratio()
    rospy.spin()