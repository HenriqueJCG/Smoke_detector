#!/usr/bin/env python
"""
Point ratio node to calculate the ratio of lidar points to radar points

Compares the point ratio in the overlapping field of view of the sensors,
and publishes the smoke probability considering the ratio between radar and lidar, 
as well as the lidar point ratio to the maximum lidar points in a frame.
"""

import rospy, math, csv
import numpy as np
from sensor_msgs.msg import PointCloud2, PointCloud
from std_msgs.msg import Float64
import sensor_msgs.point_cloud2 as pc2
from livox_ros_driver.msg import CustomMsg


class Point_Ratio:
    def __init__(self):
        rospy.init_node("point_ratio")

        self.radar_points = 1
        self.lidar_points = 1
        self.max_points   = 1
        self.running = True

        self.lidar_xyz = np.array([])
        self.radar_xyz = np.array([])

        self.log = []
        self.start_time = rospy.Time.now().to_sec()

        self._lidar_ratio  = 1.0
        self._sensor_ratio = 1.0

        self.mode = rospy.get_param("~mode")

        if self.mode == 'livox':
            rospy.Subscriber("/radar_enhanced_pcl2", PointCloud2,  self.radar_callback)
            rospy.Subscriber("/livox/points",        PointCloud2,   self.lidar_callback)
            self.MAX_RANGE = 260
            self.H_FOV     = 80.0
            self.V_FOV_MIN = -15.0
            self.V_FOV_MAX =  15.0
            self.pub_lidar_pcl = rospy.Publisher("/filtered_livox",PointCloud2,queue_size=10)
            self.pub_radar_pcl = rospy.Publisher("/filtered_oculii",PointCloud2,queue_size=10)

        elif self.mode == 'ouster128':
            rospy.Subscriber("/ouster/points",               PointCloud2, self.lidar_callback)
            rospy.Subscriber("/oculii_radar/point_cloud",    PointCloud2, self.radar_callback)
            self.MAX_RANGE = 200 #78 Hugin
            self.H_FOV     = 113.0
            self.V_FOV_MIN = -22.0
            self.V_FOV_MAX =  22.0
            self.pub_lidar_pcl = rospy.Publisher("/filtered_ouster",PointCloud2,queue_size=10)
            self.pub_radar_pcl = rospy.Publisher("/filtered_oculii",PointCloud2,queue_size=10)
        else:
            rospy.Subscriber("/hugin_raf_1/radar_data", PointCloud2, self.radar_callback)
            rospy.Subscriber("/ouster/points",          PointCloud2, self.lidar_callback)
            self.MAX_RANGE = 78 #78 Hugin
            self.H_FOV     = 90.0
            self.V_FOV_MIN = -15.0
            self.V_FOV_MAX =  15.0
            self.pub_lidar_pcl = rospy.Publisher("/filtered_ouster",PointCloud2,queue_size=10)
            self.pub_radar_pcl = rospy.Publisher("/filtered_hugin",PointCloud2,queue_size=10)

        self.pub       = rospy.Publisher("point_ratio",   Float64, queue_size=10)
        self.pub_lidar = rospy.Publisher("lidar_points",  Float64, queue_size=10)
        self.pub_radar = rospy.Publisher("radar_points",  Float64, queue_size=10)

    # ------------------------------------------------------------------

    def filter_by_fov_and_range(self, pts):
        if len(pts) == 0:
            return np.array([])

        ranges    = np.linalg.norm(pts, axis=1)
        mask      = (ranges > 0.5) & (ranges < self.MAX_RANGE)

        xy_ranges = np.linalg.norm(pts[:, :2], axis=1)
        elevation = np.degrees(np.arctan2(pts[:, 2], xy_ranges))
        mask     &= (elevation >= self.V_FOV_MIN) & (elevation <= self.V_FOV_MAX)

        azimuth   = np.degrees(np.arctan2(pts[:, 1], pts[:, 0]))
        mask     &= (azimuth >= -self.H_FOV / 2) & (azimuth <= self.H_FOV / 2)

        return pts[mask]

    def cloud2_to_xyz(self, msg):
        pts = np.array(list(pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True)))
        if len(pts) == 0:
            return np.array([]).reshape(0, 3)
        return pts[~np.all(pts == 0, axis=1)]

    # ------------------------------------------------------------------

    def probability(self):
        self._lidar_ratio = self.lidar_points / max(self.max_points, 1)

        lidar_filtered = self.filter_by_fov_and_range(self.lidar_xyz)
        radar_filtered = self.filter_by_fov_and_range(self.radar_xyz)
        fov_ratio = len(lidar_filtered) / max(len(radar_filtered), 1)
        fov_ratio = min(fov_ratio, 1.0)   # clamp to [0, 1]

        self.prob = 0.5 * self._lidar_ratio + 0.5 * fov_ratio

        if self.prob<0.2:
            self.running=False
        elif self.prob>0.7 and not self.running:
            self.running=True

        self.pub.publish(self.prob)
        self.pub_lidar.publish(float(self.lidar_points))
        self.pub_radar.publish(float(self.radar_points))

        t = rospy.Time.now().to_sec() - self.start_time
        self.log.append([t, self.prob])

    # ------------------------------------------------------------------

    def radar_callback(self, msg):
        if self.mode == 're':
            self.radar_points = len(msg.points)
            pts = [[p.x, p.y, p.z] for p in msg.points]
            self.radar_xyz = np.array(pts) if pts else np.array([]).reshape(0, 3)
        else:
            self.radar_points = msg.width * msg.height
            self.radar_xyz    = self.cloud2_to_xyz(msg)

        self.probability()
        if not self.running:
             self.pub_radar_pcl.publish(msg)

    def lidar_callback(self, msg):
        if self.mode == 're':
            self.lidar_points = 1
            pts = []
            for p in msg.points:
                if p.reflectivity > 0:
                    self.lidar_points += 1
                pts.append([p.x, p.y, p.z])
            self.max_points = msg.point_num
            self.lidar_xyz  = np.array(pts) if pts else np.array([]).reshape(0, 3)
        else:
            self.lidar_xyz    = self.cloud2_to_xyz(msg)
            self.lidar_points = len(self.lidar_xyz)
            self.max_points   = msg.width * msg.height

        self.probability()
        if self.running:
             self.pub_lidar_pcl.publish(msg)

    # ------------------------------------------------------------------

    def save_csv(self):
        with open("visibility_log.csv", "w") as f:
            writer = csv.writer(f)
            writer.writerow(["time", "prob"])
            writer.writerows(self.log)

if __name__ == "__main__":
    node = Point_Ratio()
    rospy.on_shutdown(node.save_csv)  # fixed from atexit
    rospy.spin()