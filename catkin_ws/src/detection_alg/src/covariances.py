#!/usr/bin/env python
import numpy as np
import rospy
from nav_msgs.msg import Odometry
from std_msgs.msg import Float32


def _apply_baseline(cov_flat, baseline_diag):
    cov = np.array(cov_flat, dtype=float).reshape(6, 6)
    if np.allclose(np.diag(cov), 0.0, atol=1e-12):
        cov = np.diag(baseline_diag).astype(float)
    return cov


def _scale(cov6x6, factor):
    return (cov6x6 * factor).flatten().tolist()


class SmokeGatedCovarianceNode(object):
    def __init__(self):
        
        self.lidar_odom_topic = rospy.get_param('lidar_odom_topic', '/genz/odometry')
        self.radar_odom_topic = rospy.get_param('radar_odom_topic', '/kiss/odometry')
        self.smoke_topic = rospy.get_param('smoke_topic', '/point_ratio')
        self.lidar_odom_out_topic = rospy.get_param('lidar_odom_out_topic', '/odom/lidar')
        self.radar_odom_out_topic = rospy.get_param('radar_odom_out_topic', '/odom/radar')

        self.lidar_trust_min = float(rospy.get_param('~lidar_trust_min', 0.05))
        self.radar_trust_min = float(rospy.get_param('~radar_trust_min', 0.05))
        self.gain = float(rospy.get_param('~smoke_gain', 1.0))
        self.invert = bool(rospy.get_param('~invert', True))
        self.smoke_timeout = float(rospy.get_param('~smoke_timeout_sec', 1.0))

        self.lidar_base_pose = list(rospy.get_param('~lidar_baseline_pose_diag', [0.01, 0.01, 0.05, 0.02, 0.02, 0.02]))
        self.lidar_base_twist = list(rospy.get_param('~lidar_baseline_twist_diag', [0.02, 0.02, 0.05, 0.02, 0.02, 0.02]))
        self.radar_base_pose = list(rospy.get_param('~radar_baseline_pose_diag', [0.05, 0.05, 0.20, 0.10, 0.10, 0.05]))
        self.radar_base_twist = list(rospy.get_param('~radar_baseline_twist_diag', [0.05, 0.05, 0.20, 0.10, 0.10, 0.05]))

        self.smoke_prob = 0.0
        self.last_smoke_stamp = None

        self.sub_smoke = rospy.Subscriber(self.smoke_topic, Float32, self._smoke_cb, queue_size=10)
        self.sub_lidar = rospy.Subscriber(self.lidar_odom_topic, Odometry, self._lidar_cb, queue_size=10)
        self.sub_radar = rospy.Subscriber(self.radar_odom_topic, Odometry, self._radar_cb, queue_size=10)

        self.pub_lidar = rospy.Publisher(self.lidar_odom_out_topic, Odometry, queue_size=10)
        self.pub_radar = rospy.Publisher(self.radar_odom_out_topic, Odometry, queue_size=10)


    def _smoke_cb(self, msg):
        self.smoke_prob = float(np.clip(msg.data, 0.0, 1.0))
        self.last_smoke_stamp = rospy.Time.now()
        

    def _stale(self):
        if self.last_smoke_stamp is None:
            return True
        age = (rospy.Time.now() - self.last_smoke_stamp).to_sec()
        return age > self.smoke_timeout

    def _trusts(self):
        if self._stale():
            return 1.0, 1.0 

        p = self.smoke_prob ** self.gain

        lidar_trust = self.lidar_trust_min + (1.0 - self.lidar_trust_min) * p
        radar_trust = self.radar_trust_min + (1.0 - self.radar_trust_min) * (1.0 - p)

        if self.invert:
            lidar_trust, radar_trust = radar_trust, lidar_trust

        return lidar_trust, radar_trust

    def _lidar_cb(self, msg):
        lidar_trust, _ = self._trusts()
        pose_cov = _apply_baseline(msg.pose.covariance, self.lidar_base_pose)
        twist_cov = _apply_baseline(msg.twist.covariance, self.lidar_base_twist)
        msg.pose.covariance = _scale(pose_cov, 1.0 / lidar_trust)
        msg.twist.covariance = _scale(twist_cov, 1.0 / lidar_trust)
        self.pub_lidar.publish(msg)

    def _radar_cb(self, msg):
        _, radar_trust = self._trusts()
        pose_cov = _apply_baseline(msg.pose.covariance, self.radar_base_pose)
        twist_cov = _apply_baseline(msg.twist.covariance, self.radar_base_twist)
        msg.pose.covariance = _scale(pose_cov, 1.0 / radar_trust)
        msg.twist.covariance = _scale(twist_cov, 1.0 / radar_trust)
        self.pub_radar.publish(msg)


def main():
    rospy.init_node('smoke_gated_covariance_node')
    SmokeGatedCovarianceNode()
    rospy.spin()


if __name__ == '__main__':
    main()