#!/usr/bin/env python
import rospy
import math, csv
from sensor_msgs.msg import PointCloud2,PointCloud
from std_msgs.msg import Float64
import sensor_msgs.point_cloud2 as pc2
from livox_ros_driver.msg import CustomMsg
from scipy.spatial import cKDTree
import numpy as np


class Point_Ratio:
   def __init__(self):
       rospy.init_node("point_ratio")


       self.radar_points = 1
       self.lidar_points = 1
       self.max_points = 1


       #=================
       self.match_threshold = rospy.get_param("~match_threshold", 1.0)  # meters
       self.alpha = rospy.get_param("~smoothing", 0.1)
      
       self.lidar_xyz = None
       self.kdtree = None


       self.prev_prob = 0.0


       #=================


       self._lidar_ratio = self.lidar_points / self.max_points
       self._sensor_ratio = self.lidar_points / self.radar_points


       self.mode = rospy.get_param("~mode")
      
       if self.mode == 'livox':
           rospy.Subscriber("/radar_enhanced_pcl", PointCloud, self.radar_callback)
           rospy.Subscriber("/livox/lidar", CustomMsg, self.lidar_callback)
       else:
           rospy.Subscriber("/ouster/points", PointCloud2, self.lidar_callback)
           rospy.Subscriber("/oculii_radar/point_cloud", PointCloud2, self.radar_callback)
           #rospy.Subscriber("/hugin_raf_1/radar_data", PointCloud2, self.radar_callback)
           #rospy.Subscriber("/ouster/points", PointCloud2, self.lidar_callback)


       self.pub = rospy.Publisher("point_ratio", Float64, queue_size=10)
       self.pub_lidar = rospy.Publisher("lidar_points", Float64, queue_size=10)
       self.pub_radar = rospy.Publisher("radar_points", Float64, queue_size=10)


       self.rate = rospy.Rate(10)


   #=================
   def cloud_to_xyz(self, msg):
       pts = []
       for p in pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True):
           if not (p[0] == 0 and p[1] == 0 and p[2] == 0):
               pts.append([p[0], p[1], p[2]])
       return np.array(pts)
   #=================




   def probability(self):
       self._lidar_ratio = self.lidar_points / self.max_points
       self._sensor_ratio = self.lidar_points / (self.radar_points)


       self.pub.publish(self._sensor_ratio)
       self.pub_lidar.publish(self.lidar_points)  
       self.pub_radar.publish(self.radar_points)


   def radar_callback(self, msg):
       #=================
       pts = []


       if self.kdtree is None:
           return
       #=================


       if self.mode == 'livox':
           self.radar_points = len(msg.points)


           #=================
           for p in msg.points:
               pts.append([p.x, p.y, p.z])
           #=================
       else:
           self.radar_points = msg.width * msg.height
           pts = self.cloud_to_xyz(msg)


       #=================
       if len(pts) == 0:
           return


       matches = 0


       for p in pts:
           dist, _ = self.kdtree.query(p, k=1)


           if dist < self.match_threshold:
               matches += 1


       match_ratio = matches / float(len(pts))


       raw_prob = 1.0 - match_ratio


       prob = self.alpha * self.prev_prob + (1.0 - self.alpha) * raw_prob
       self.prev_prob = prob




       #=================
       #self.probability()
       self.pub.publish(prob)
       self.pub_lidar.publish(self.lidar_points)  
       self.pub_radar.publish(self.radar_points)


   def lidar_callback(self, msg):
       pts = []
       if self.mode == 'livox':
           self.lidar_points = 1


           for p in msg.points:
               if p.reflectivity > 0:
                   self.lidar_points += 1




               pts.append([p.x, p.y, p.z]) #=================


           self.max_points = msg.point_num
       else:


           self.lidar_points = sum( 1 for p in pc2.read_points(msg, field_names=("x","y","z")) if not (p[0] == 0 and p[1] == 0 and p[2] == 0))
           self.max_points = msg.width * msg.height


           #=================
           pts = self.cloud_to_xyz(msg)
       if len(pts) == 0:
           return


       self.lidar_xyz = pts
       if len(self.lidar_xyz) > 10:
           self.kdtree = cKDTree(self.lidar_xyz)


       #=================
  
       #self.probability()


if __name__ == "__main__":
   node = Point_Ratio()
   rospy.spin()
