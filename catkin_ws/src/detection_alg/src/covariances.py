#!/usr/bin/env python
import numpy as np
import rospy
from nav_msgs.msg import Odometry
from std_msgs.msg import Float64


class SmokeGatedCovarianceNode(object):
    def __init__(self):
        
        self.lidar_odom_topic = rospy.get_param('lidar_odom_topic', '/kiss/odometry')
        self.radar_odom_topic = rospy.get_param('radar_odom_topic', '/genz/odometry')
        self.smoke_topic = rospy.get_param('smoke_topic', '/point_ratio')
        self.lidar_odom_out_topic = rospy.get_param('lidar_odom_out_topic', '/odom/lidar')
        self.radar_odom_out_topic = rospy.get_param('radar_odom_out_topic', '/odom/radar')

        self.lidar_trust_min = float(rospy.get_param('lidar_trust_min', 0.001))
        self.radar_trust_min = float(rospy.get_param('radar_trust_min', 0.001))
        self.smoke_timeout = float(rospy.get_param('smoke_timeout_sec', 1.0))

        self.smoke_prob = 1.0  # assume good lidar until told otherwise
        self.lidar_on=True
        self.last_smoke_stamp = None

        rospy.Subscriber(self.smoke_topic, Float64, self._smoke_cb, queue_size=10)
        rospy.Subscriber(self.lidar_odom_topic, Odometry, self._lidar_cb, queue_size=10)
        rospy.Subscriber(self.radar_odom_topic, Odometry, self._radar_cb, queue_size=10)

        self.pub_lidar = rospy.Publisher(self.lidar_odom_out_topic, Odometry, queue_size=10)
        self.pub_radar = rospy.Publisher(self.radar_odom_out_topic, Odometry, queue_size=10)

    def _smoke_cb(self, msg):
        self.smoke_prob = float(np.clip(msg.data, 0.0, 1.0))
        self.last_smoke_stamp = rospy.Time.now()

    def _lidar_trust(self):

        p = self.smoke_prob
        return self.lidar_trust_min + (1.0 - self.lidar_trust_min) * p


    def _radar_trust(self):

        p = self.smoke_prob
        return self.radar_trust_min + (1.0 - self.radar_trust_min) * (1.0 - p)

    def _lidar_cb(self, msg):
        if self.smoke_prob < 0.2:
            # severe degeneracy: don't fuse lidar at all this cycle
            self.lidar_on=False
            return
        
        if self.smoke_prob > 0.7 and self.lidar_on==False:
            self.lidar_on=True

        if self.lidar_on:
            trust = self._lidar_trust()
            msg.pose.covariance = tuple(c / trust for c in msg.pose.covariance)
            msg.twist.covariance = tuple(c / trust for c in msg.twist.covariance)
            self.pub_lidar.publish(msg)

    def _radar_cb(self, msg):
        trust = self._radar_trust()
        msg.pose.covariance = tuple(c / trust for c in msg.pose.covariance)
        msg.twist.covariance = tuple(c / trust for c in msg.twist.covariance)
        self.pub_radar.publish(msg)


def main():
    rospy.init_node('smoke_gated_covariance_node')
    SmokeGatedCovarianceNode()
    rospy.spin()


if __name__ == '__main__':
    main()