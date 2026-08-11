#!/usr/bin/env python
"""
Text marker node to publish topic for display in rviz

Subscribes to point ratio probability from detection.py or kdtree_detection.py, total radar points and total lidar points 
Publishes a Marker topic with the information from the subscribed topics

"""
import rospy
import math, csv
from visualization_msgs.msg import Marker
from std_msgs.msg import Float64

class RadarTextMarker:
    def __init__(self):
        rospy.init_node("radar_text_marker")

        #Variables to prevent division by 0
        self._sensor_ratio = 1.0
        self._lidar_points = 1.0
        self._radar_points = 1.0

        #Subscribers
        rospy.Subscriber("/point_ratio", Float64, self.callback)
        rospy.Subscriber("/lidar_points", Float64, self.callback_lidar)
        rospy.Subscriber("/radar_points", Float64, self.callback_radar)

        self.pub = rospy.Publisher("visualization_marker", Marker, queue_size=10)

        self.rate = rospy.Rate(10)

    def callback_lidar(self, msg):
        self._lidar_points = msg.data

    def callback_radar(self, msg):
        self._radar_points = msg.data

    def callback(self, msg):
        self._sensor_ratio = msg.data

        marker = Marker()
        marker.header.frame_id = "odom"
        marker.header.stamp = rospy.Time.now()

        marker.ns = "radar_info"
        marker.id = 0
        marker.type = Marker.TEXT_VIEW_FACING
        marker.action = Marker.ADD

        marker.pose.position.x = 0.0
        marker.pose.position.y = 0.0
        marker.pose.position.z = 2.0

        marker.scale.z = 1.5

        if (self._sensor_ratio) < 0.2:
            marker.color.r = 1.0
            marker.color.g = 0.0
            marker.color.b = 0.0
            marker.color.a = 1.0
        elif (self._sensor_ratio) >= 0.2 and (self._sensor_ratio) < 0.5:
            marker.color.r = 1.0
            marker.color.g = 1.0
            marker.color.b = 0.0
            marker.color.a = 1.0    
        else:
            marker.color.r = 0.0
            marker.color.g = 1.0
            marker.color.b = 0.0
            marker.color.a = 1.0

        marker.text = (
            f"Sensor Point Ratio: {self._sensor_ratio:.3f}"
            f"\nLidar Points: {self._lidar_points:.0f}"
            f"\nRadar Points: {self._radar_points:.0f}"

        )

        self.pub.publish(marker)

if __name__ == "__main__":
    node = RadarTextMarker()
    rospy.spin()