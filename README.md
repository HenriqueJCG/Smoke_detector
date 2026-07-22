# ROS1 Radar Perception Code

Repository for the code related to the Radar based EKF LiDAR-Radar fusion developed for ROS1 Noetic.

---

### [KISS-ICP v0.3.0](https://github.com/PRBonn/kiss-icp/blob/v0.3.0/ros/README.md)

**NTU4DRadLM**

```roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox```

```roslaunch kiss_icp odometry.launch topic:=/livox/points/ dataset_type:=livox```

**Eskilstuna Forest**

```roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster```

```roslaunch kiss_icp odometry.launch topic:=/hugin_raf_1/radar_data dataset_type:=ouster```

### [GENZ-ICP](https://github.com/cocel-postech/genz-icp)

**NTU4DRadLM**

```roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox```

```roslaunch genz_icp odometry.launch topic:=/livox/points/ dataset_type:=livox```

**Eskilstuna Forest**

```roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster```

```roslaunch genz_icp odometry.launch topic:=/hugin_raf_1/radar_data dataset_type:=ouster```


### [EKF](https://github.com/cra-ros-pkg/robot_localization/tree/noetic-devel)

Basic launch: ```roslaunch robot_localization ekf_template.launch```

Full launch example: ```roslaunch robot_localization ekf_template.launch dataset_type:=ouster egovelocity:=true radar:=false fusion:=true point_algorithm:=fov```

**Customizable parameters:**

Select dataset: dataset_type (livox/ouster/ouster128)

Use EKF fusion: fusion (true/false)

Use RADAR ICP odometry: radar (true/false)

Use LiDAR ICP odometry (Fusion already starts this): lidar (false/true)

Use RADAR ego velocity estimation: egovelocity (false/true)

Select detection algorithm: point_algorithm (fov/kdtree)

Select bag replay speed: bag_rate (0.1>)

---

**Youtube Playlist:** [https://youtube.com/playlist?list=PL5dDSTSIq7yJWkVsNU3b_be_bDQzBtLgO&si=xRb-qyhVP9_qFgAG](https://youtube.com/playlist?list=PL5dDSTSIq7yJWkVsNU3b_be_bDQzBtLgO&si=xRb-qyhVP9_qFgAG)