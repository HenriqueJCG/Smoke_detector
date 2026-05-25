export LIBGL_ALWAYS_SOFTWARE=1
roscore &
rviz &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch fast_lio mapping_horizon.launch &
roslaunch FAST_LIO mapping_horizon.launch &
cd /src
cd src
git clone https://github.com/hku-mars/FAST_LIO.git
cd ..
catkin_make
source devel/setup.bash
apt-get install -y ros-noetic-eigen-conversions
apt-cache search ros-noetic | head
apt-get install ros-noetic-eigen-conversions
apt-get install -y python3-rosdep
rosdep update
roslaunch FAST_LIO mapping_horizon.launch &
catkin_make
roslaunch livox_ros_driver livox_lidar_msg.launch
roslaunch livox_ros_driver livox_lidar_msg.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
rosrun tf2_ros static_transform_publisher   0 0 0 0 0 0 base_link livox_frame &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch lio_livox horizon.launch
cd ~/catkin_ws/src
git clone https://github.com/Livox-SDK/LIO-Livox
cd ..

cd ~/catkin_ws
source devel/setup.bash
roslaunch lio_livox horizon.launch
ls ~/catkin_ws/devel/lib/lio_livox/
cd ~/catkin_ws
rm -rf build devel
sudo apt-get update
sudo apt-get install -y python3-rosdep
sudo rosdep init        # only first time in container
rosdep update
rosdep install --from-paths src --ignore-src -r -y
apt-cache search ros-noetic-eigen-conversions
sudo apt update
sudo apt install ros-noetic-eigen-conversions
catkin_make
sudo apt install ros-noetic-tf-conversions
sudo apt install ros-noetic-geometry
catkin_make
sudo apt install ros-noetic-Ceres
sudo apt-get install cmake
# google-glog + gflags
sudo apt-get install libgoogle-glog-dev libgflags-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install libeigen3-dev
sudo apt-get install libsuitesparse-dev
catkin_make
sudo apt install libceres-dev
catkin_make
cd ~/catkin_ws/src
git clone git@github.com:hku-mars/ikd-Tree.git
cd ~/catkin_ws/src
git clone git@github.com:hku-mars/ikd-Tree.git
cd ikd-Tree/build
cmake ..
catkin_make
cd ..
catkin_make
cd ~/catkin_ws/src
git clone git@github.com:hku-mars/ikd-Tree.git
cd ikd-Tree/build
cmake ..
unzip ikd-Tree-master.zip -d ~/catkin_ws/src/FAST_LIO/include/ikd-Tree
catkin_make
cd ..
catkin_make
cd ~/catkin_ws
rm -rf build devel
catkin build
catkin_make
rm -rf build devel
catkin_make
git clone git@github.com:hku-mars/ikd-Tree.git
catkin_make
~/catkin_ws/src/FAST_LIO/include/ikd-Tree/ikd_Tree.cpp
~/catkin_ws/src/FAST_LIO/include/ikd-Tree/ikd_Tree.h
~/catkin_ws/src/FAST_LIO
~/catkin_ws/src/FAST_LIO/include/ikd-Tree
~/catkin_ws/src/FAST_LIO/include
~/catkin_ws/src/FAST_LIO/include/ikd-Tree
~/catkin_ws/src/FAST_LIO/include/ikd-Tree/ikd_Tree.h
ls ~/catkin_ws/src/FAST_LIO/include/ikd-Tree
ls ~/catkin_ws/src/FAST_LIO/include
ls ~/catkin_ws/src/FAST_LIO/include/ikd-Tree
catkin_make
cd ~/catkin_ws
source devel/setup.bash
roslaunch lio_livox horizon.launch
roslaunch fast_lio mapping_horizon.launch
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_1.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_1.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_1.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_1.bag --clock
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_1.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_1.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_1.bag --clock
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rostopic list
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rostopic echo /your_path_topic
rostopic echo /path
rostopic echo /path &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rostopic echo /path &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
sudo apt-get install libsuitesparse-dev
cd ~/catkin_ws
source devel/setup.bash
roslaunch lio_livox horizon.launch
roscore &
rviz &
LIBGL_ALWAYS_SOFTWARE=1
rviz &
LIBGL_ALWAYS_SOFTWARE=1
rviz &
roscore &
LIBGL_ALWAYS_SOFTWARE=1
roscore &
rviz &
roscore &
rviz &
LIBGL_ALWAYS_SOFTWARE=1
rviz &
LIBGL_ALWAYS_SOFTWARE=1
rviz &
glxinfo | grep OpenGL
export LIBGL_ALWAYS_SOFTWARE=1
roscore &
rviz &
rosbag play /home/Datasets/fog.bag --clock
rviz
rostopic list &
rosbag play /home/Datasets/fog.bag --clock
rviz &
rosbag play /home/Datasets/fog.bag --clock
sudo apt install -y             build-essential             libeigen3-dev               libjsoncpp-dev              libspdlog-dev               libcurl4-openssl-dev        cmake
mkdir -p catkin_ws/src && cd catkin_ws/src
git clone --recurse-submodules https://github.com/ouster-lidar/ouster-ros.git
source /opt/ros/noetic/setup.bash 
cd catkin_ws
catkin_make --cmake-args -DCMAKE_BUILD_TYPE=Release
cd ..
cd catkin_ws
catkin_make --cmake-args -DCMAKE_BUILD_TYPE=Release
cd ..
cd ~/catkin_ws
catkin_make --cmake-args -DCMAKE_BUILD_TYPE=Release
rviz &
rosbag play /home/Datasets/fog.bag --clock
roslaunch ouster_ros replay.launch          bag_file:=<path to rosbag file>     \
roslaunch ouster_ros replay.launch /home/Datasets/fog.bag
roslaunch ouster_ros replay.launch bag_file:=/home/Datasets/fog.bag
roscd ouster_ros
cd src
git clone --recurse-submodules https://github.com/ouster-lidar/ouster-ros.git
source /opt/ros/noetic/setup.bash
cd ..
catkin_make --cmake-args -DCMAKE_BUILD_TYPE=Release
sudo apt update
sudo apt install libzip-dev
catkin_make --cmake-args -DCMAKE_BUILD_TYPE=Release
roscd ouster_ros
roscd ouster-ros
roslaunch ouster_ros replay.launch bag_file:=/home/Datasets/fog.bag
roslaunch ouster-ros replay.launch bag_file:=/home/Datasets/fog.bag
roslaunch ouster_ros replay.launch bag_file:=/home/Datasets/fog.bag
roscd ouster-ros
cd src
roscd ouster-ros
cd ..
source ~/catkin_ws/devel/setup.bash
roscd ouster-ros
roscd ouster_ros
cd ..
roslaunch ouster_ros replay.launch bag_file:=/home/Datasets/fog.bag
rviz &
roslaunch ouster_ros replay.launch bag_file:=/home/Datasets/fog.bag
rosnode kill -a
roscd af_rlio
ls nodes/  # or check inside src/ if using a catkin workspace
ls src/  # or check inside src/ if using a catkin workspace
cd ..
catkin_make
cd ..
catkin_make
roslaunch af_rlio mapping_ouster64.launch &
rostopic list
rostopic echo /path
rostopic echo /clock
rostopic list

rostopic list
rostopic echo /Lase_map
rostopic echo /Laser_map
rostopic list
rosnode kill -a
rostopic list
rostopic echo /af_rlio/path_update
rosnode kill -a
rostopic list
rosnode kill -a
rostopic list
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rviz &
rosnode kill -a
echo 'export LIBGL_ALWAYS_SOFTWARE=1' >> ~/.bashrc
rviz &
source devel/setup.bash 
roslaunch af_rlio mapping_ouster64.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch af_rlio mapping_ouster64.launch &
rosnode kill -a
roslaunch af_rlio mapping_ouster64.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch fast_lio mapping_avia.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch af_rlio mapping_ouster64.launch &
rostopic list
rosrun tf view_frames
rostopic list
rosrun tf view_frames
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
catkin_make
source devel/setup.bash 
roslaunch af_rlio mapping_ouster64.launch &
rosnode kill -a
catkin_make
source devel/setup.bash
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosnode kill -a
roslaunch af_rlio mapping_ouster64.launch &
add_definitions(-DROOT_DIR=\"${CMAKE_CURRENT_SOURCE_DIR}/\")
grep -r "AF-RLIO" ~/catkin_ws/src
catkin_make
roslaunch af_rlio mapping_ouster64.launch &
catkin_make
source devel/setup.bash
roslaunch af_rlio mapping_ouster64.launch &
cd src
git clone https://github.com/Wayne-DWA/RIV-SLAM
cd ..
catkin_make
sudo apt install libsophus-dev
cd src
git clone https://github.com/strasdat/Sophus.git
cd ..
catkin_make
ls /usr/include/sophus/so3.hpp
ls /usr/local/include/sophus/so3.hpp
catkin_make
df -h
catkin_make_isolated
catkin_make
sudo apt-get install libsophus-dev
catkin_make
cd ~/catkin_ws/src
git clone https://github.com/CLASS-Lab/EFEAR-4D.git
cd ..
catkin_make
source devel/setup.bash
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch efear run.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
catkin_make
roslaunch efear run.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
catkin_make
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch efear run.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosnode kill -a
roslaunch efear run.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
catkin_make
rosnode kill -a
catkin_make
roslaunch efear run.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosnode kill -a
catkin_make
source devel/setup.bash
roslaunch efear run.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch efear run.launch &
catkin_make
source devel/setup.bash
roslaunch efear run.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosnode kill -a
roscore
roscore &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roscore &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch efear run.launch
roslaunch efear run.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_1.bag --clock
rosnode kill -a
roscore &
source devel/setup.bash 
roslaunch af_rlio mapping_ouster64.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch af_rlio mapping_ouster64.launch &
rosnode kill -a
killall rosocre
killall roscore
catkin_make
rosnode kill -a
roslaunch af_rlio mapping_ouster64.launch &
rosnode kill -a
roslaunch af_rlio mapping_ouster64.launch &
rviz &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rosnode kill -a
catkin_make
rosnode kill -a
roslaunch af_rlio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch fast_lio mapping_horizon.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch ig_lio avia.launch &
roslaunch ig_lio lio_avia.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch ig_lio lio_avia.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch ig_lio lio_avia.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch ig_lio lio_avia.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
catkin_make
roslaunch ig_lio lio_bg_velodyne.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_1.bag --clock
roslaunch ig_lio lio_bg_velodyne.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_1.bag --clock
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_2.bag --clock
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_3.bag --clock
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_4.bag --clock
clear
roslaunch af_rlio mapping_ouster64.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch af_rlio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch af_rlio mapping_ouster64.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosnode kill -a
roslaunch af_rlio mapping_ouster64.launch &
rosnode kill -a
roslaunch af_rlio mapping_ouster64.launch &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch af_rlio mapping_ouster64.launch &
rosnode kill -a
roslaunch af_rlio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch af_rlio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rostopic list
roscore
roscore &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch af_rlio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rosnode kill -a
cd src
git clone https://github.com/dan11003/CFEAR_Radarodometry_code_public.git
cd ..
catkin_make -DCMAKE_BUILD_TYPE=Release 
source devel/setup.bash
catkin_make -DCMAKE_BUILD_TYPE=Release 
source devel/setup.bash
roscd cfear_radarodometry/launch
./kvarntorp_demo 
catkin_make -DCMAKE_BUILD_TYPE=Release 
cd ..
catkin_make -DCMAKE_BUILD_TYPE=Release 
roscd cfear_radarodometry/launch
./kvarntorp_demo 
cd volvo_CE
./run_sequence_volvoce
cd ..
catkin_make -DCMAKE_BUILD_TYPE=Release 
roscd cfear_radarodometry/launch
cd volvo_CE
./run_sequence_volvoce
rosnode kill -a
cd src
git clone https://github.com/ethz-asl/rio.git
cd ..
cd src
git clone https://github.com/ethz-asl/rio.git
git clone https://github.com/ethz-asl/lpp.git
git clone https://github.com/rikba/gtsam_catkin.git
cd ..
source devel/setup.bash
catkin_make
cd src
git clone https://github.com/christopherdoer/rio
cd ..
catkin_make
cd src
git submodule update --init --recursive
cd ..
catkin_make
catkin_make clean
cd ~/catkin_ws
rm -rf build devel
catkin_make
cd src
cd rio
git submodule update --init --recursive
cd ..
catkin_make
catkin build reve rio_utils
catkin build x_rio
catkin_make
catkin_make --pkg rio_utils
catkin_make --pkg radar_ego_velocity_estimator
catkin_make
source devel/setup.bash
roslaunch x_rio x_rio.launch
roslaunch rio x_rio.launch
cd src
roslaunch rio x_rio.launch
roslaunch x_rio x_rio.launch
cd ..
catkin_make
source devel/setup.bash
roslaunch x_rio x_rio.launch
roslaunch x_rio x_rio_demo.launch
catkin_make
roslaunch x_rio sim_x_rio.launch
rviz &
rosbag play /home/Datasets/fog.bag --clock
rosnode kill -a
rviz &
rosbag play /home/Datasets/fog.bag --clock
rosnode kill -a
rosbag play /home/Datasets/fog.bag --clock
cd src
git clone https://github.com/Wayne-DWA/RIV-SLAM
cd ..
catkin_make
sudo apt update
sudo apt install ros-noetic-sophus
catkin_make
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch &
rosnode kill -a
roslaunch radar_graph_slam radar_graph_slam.launch &
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch &
cd ~/catkin_ws
rm -rf build devel
catkin_make --pkg radar_graph_slam
ls ~/catkin_ws/src | grep msgs
cd ~/catkin_ws
catkin_make
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch &
ls ~/catkin_ws/src/RIV-SLAM
ls ~/catkin_ws/src/RIV-SLAM/msgs_radar/msg
source ~/catkin_ws/devel/setup.bash
rospack find msgs_radar
echo $ROS_PACKAGE_PATH
rospack find msgs_radar
ls ~/catkin_ws/devel/include/msgs_radar
roslaunch radar_graph_slam radar_graph_slam.launch &
#build the repo
catkin build msgs_radar fast_apdgicp radar_graph_slam
rosnode kill -a
roscore &
rosnode kill -a
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
source devel/setup.bash
roslaunch efear run.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_1.bag --clock
catkin_make
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch x_rio x_rio_demo.launch type:=rosbag_node enable_rviz:=True enable_plot:=True
roslaunch x_rio x_rio_demo.launch type:=ros_node enable_rviz:=True enable_plot:=False
rosbag play --clock demo_x_rio.bag
catkin_make
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch
roscore &
rviz &
rosbag play /home/Datasets/fog.bag --clock
cd ~/catkin_ws/src
git clone https://github.com/ailab-hanyang/Radar4Motion.git
sudo apt update
sudo apt install nlohmann-json3-dev
cd ..
catkin_make
source devel/setup.bash
rviz &
rosbag play /home/Datasets/SNAIL/data3.bag --clock
df -h
rviz &
rosbag play /home/Datasets/SNAIL/data3.bag --clock
rosbag play /home/Datasets/SNAIL/data2.bag --clock
cd ~/catkin_ws/src
git clone https://github.com/ailab-hanyang/Radar4Motion.git
cd ..
rviz &
rosbag play /home/Datasets/SNAIL/data3.bag --clock
rosbag play /home/Datasets/SNAIL/data2.bag --clock
rosrun tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link PandarXT-32 &
rosrun tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link ars548 &
rosrun tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link oculii &
rosbag play /home/Datasets/SNAIL/data2.bag --clock
rosnode kill -a
rviz &
rosrun tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link PandarXT-32 &
rosrun tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link ars548 &
rosrun tf2_ros static_transform_publisher 0 0 0 1.5708  0 0 base_link oculii &
rosbag play /home/Datasets/SNAIL/data2.bag --clock
rosnode kill -a
rviz &
rosrun tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link PandarXT-32 &
rosrun tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link ars548 &
rosrun tf2_ros static_transform_publisher 0 0 0 -1.5708  0 0 base_link oculii &
rosbag play /home/Datasets/SNAIL/data2.bag --clock
rosbag play /home/Datasets/SNAIL/data3.bag --clock
rosnode kill -a
catkin_make
sudo apt update
cd src
sudo apt update
sudo apt install libtbb-dev
cd ..
catkin_make
source devel/setup.bash
rosbag play /home/Datasets/SNAIL/data3.bag --clock
df -h
cdsrc
cd src
git clone https://github.com/wooseongY/Go-RIO 
cd ..
catkin_make
source devel/setup.bash
roslaunch gorio ntu_cp.launch
roslaunch gorio <launch file name>.launch
rostopic pub /command std_msgs/String "output_aftmapped"
catkin_make
source devel/setup.bash
rostopic list
rostopic echo /odom
roscore &
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch
rosnode kill -a
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch
rosnode kill -a
roslaunch radar_graph_slam radar_graph_slam.launch
rosnode kill -a
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch
rosnode kill -a
rm -rf build/ devel/
catkin_make
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch
chmod +x src/text_marker.py
cd ~/your_ws/src/radar_graph_slam/src
ls
chmod +x text_marker.py
cd ~/your_ws
catkin_make
source devel/setup.bash
rosrun radar_graph_slam text_marker.py
catkin_make
source devel/setup.bash
rosrun radar_graph_slam text_marker.py
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
roslaunch radar_graph_slam radar_graph_slam.launch
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
roslaunch radar_graph_slam radar_graph_slam.launch
rosnode kill -a
roscore &
rosnode kill -a
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
rosrun tf2_ros static_transform_publisher   0 0 0 0 0 0 base_link livox_frame &
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
df -h
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
source devel/setup.bash
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
source devel/setup.bash
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rosnode kill -a
roslaunch fast_lio mapping_ouster64.launch &
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rm -rf build devel
catkin_make
source devel/setup.bash
roslaunch fast_lio mapping_ouster64.launch &
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
rosrun tf2_ros static_transform_publisher   0 0 0 0 0 0 base_link livox_frame &
rostopic list
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
rosrun tf2_ros static_transform_publisher   0 0 0 0 0 0 base_link livox_frame &
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
rosrun tf2_ros static_transform_publisher   0 0 0 0 0 0 base_link livox_frame &
roslaunch radar_graph_slam radar_graph_slam.launch
rosnode kill -a
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
rosrun tf2_ros static_transform_publisher   0 0 0 0 0 0 base_link livox_frame &
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rostopic list
rosrun tf view_frames
rosrun tf2_ros static_transform_publisher 0 0 0 0 0 0 body base_link
rostopic list
rosrun tf view_frames
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rosrun tf2_ros static_transform_publisher 0 0 0 0 0 0 body base_link &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
pip install kiss-icp
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rviz &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rosnode kill -a
rviz &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
catkin_make
source devel/setup.bash
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
rosnode kill -a
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
rosnode kill -a
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
rosnode kill -a
rostopic list
rostopic echo -n1 /livox/points
rostopic list
rostopic echo -n1 /livox/lidar
rostopic echo -n1 /livox/points
rostopic list
rostopic echo -n1 /livox | grep fields -A 20
rostopic echo -n1 /livox/lidar
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
rosrun tf2_ros static_transform_publisher   0 0 0 0 0 0 base_link livox_frame &
rostopic hz /livox/lidar
roslaunch radar_graph_slam radar_graph_slam.launch
roscore &
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosnode kill -a
catkin_make
source devel/setup.bash
roslaunch fast_lio mapping_ouster64.launch &
rosode kill -a
rosnode kill -a
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_make
roslaunch fast_lio mapping_ouster64.launch &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
catkin_amek
roslaunch fast_lio mapping_ouster64.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_maek
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
rostopic echo -n1 /livox/points
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
rostopic kill -a
rosnode kill -a
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
rosnode kill -a
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
catkin_make
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_ouster64.launch 
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
caatkin_make
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
roslaunch fast_lio mapping_ouster64launch 
roslaunch fast_lio mapping_ouster64.launch 
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
roslaunch fast_lio mapping_ouster64.launch 
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
cd src
catkin_create_pkg detection_alg std_msgs rospy roscpp
cd ..
catkin_make
roslaunch fast_lio mapping_horizon.launch 
source devel/setup.bash
roslaunch fast_lio mapping_horizon.launch 
. ~/catkin_ws/devel/setup.bash
rosrun tf view_frames
roslaunch fast_lio mapping_horizon.launch 
catkin_make
rospack find detection_alg
rosrun detection_alg text_marker.py
chmod +x text_marker.py
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
roslaunch fast_lio mapping_ouster64.launch 
catkin_make
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
roslaunch fast_lio mapping_ouster64.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_ouster64.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_ouster64.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_horizon.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_horizon.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
castkin_make
catkin_make
roslaunch fast_lio mapping_horizon.launch 
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_horizon.launch 
rostopic list
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
catkin_make
roslaunch fast_lio mapping_horizon.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
rosnode kill -a
roscore &
rosnode kill -a
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_horizon.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_ouster64.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_ouster64.launch 
roslaunch ig_lio lio_bg_velodyne.launch 
roslaunch fast_lio mapping_ouster64.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_horizon.launch 
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
roslaunch radar_graph_slam radar_graph_slam.launch
roslaunch fast_lio mapping_horizon.launch 
rosrun tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link PandarXT-32 &
rosrun tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link ars548 &
rosrun tf2_ros static_transform_publisher 0 0 0 -1.5708  0 0 base_link oculii &
rosbag play /home/Datasets/SNAIL/data2.bag --clock 
rviz &
rosbag play /home/Datasets/SNAIL/data2.bag --clock 
cd ~/catkin_ws/src
git clone https://github.com/PRBonn/kiss-icp.git
cd ..
catkin_make
cd ~/catkin_ws/ && git clone https://github.com/PRBonn/kiss-icp && catkin build
pip install kiss-icp
pip3 install .
git clone https://github.com/PRBonn/kiss-icp.git
cd kiss-icp
pip3 install .
apt update
apt install -y python3-pip
pip3 install .
pip install kiss-icp
cd ..
kiss_icp_pipeline --help
kiss_icp_pipeline --visualize /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag
pip install -U rosbags
kiss_icp_pipeline --visualize /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag
kiss_icp_pipeline --visualize /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --topic /ouster/points
pip install polyscope
kiss_icp_pipeline --visualize /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --topic /ouster/points
kiss_icp_pipeline --visualize /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --topic /hugin_raf_1/radar_data
kiss_icp_pipeline --visualize /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --topic 
kiss_icp_pipeline --visualize /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag
/home/Datasets/MSCRad4r/SMOKE_A0.bag
kiss_icp_pipeline --visualize /home/Datasets/MSCRad4r/SMOKE_A0.bag
kiss_icp_pipeline --visualize /home/Datasets/MSCRad4r/SMOKE_A0.bag --topic /oculii_radar/point_cloud
kiss_icp_pipeline --visualize /home/Datasets/MSCRad4r/SMOKE_A0.bag --topic /ouster/points
kiss_icp_pipeline --visualize /home/Datasets/MSCRad4r/SMOKE_A0.bag --topic /oculii_radar/point_cloud
kiss_icp_pipeline --help
kiss_icp_pipeline --visualize /home/henrique/Downloads/02_campus_eval_filtered_2.mcap
kiss_icp_pipeline --visualize /home/Downloads/Orebro/02_campus_eval_filtered_2.mcap
kiss_icp_pipeline --visualize /home/Datasets/Orebro/02_campus_eval_filtered_2.mcap
pip install mcap-ros2-support
kiss_icp_pipeline --visualize /home/Datasets/Orebro/02_campus_eval_filtered_2.mcap
kiss_icp_pipeline --visualize /home/Datasets/Orebro/02_campus_eval_filtered_2.mcap --topic /hugin_2/radar_data
kiss_icp_pipeline --visualize /home/Datasets/Orebro/02_campus_eval_filtered_2.mcap --topic /hugin_3/radar_data
kiss_icp_pipeline --visualize /home/Datasets/Orebro/02_campus_eval_filtered_2.mcap --topic /hugin_4/radar_data
kiss_icp_pipeline --visualize /home/Datasets/Orebro/02_campus_eval_filtered_2.mcap --topic /hugin_1/radar_data
kiss_icp_pipeline --visualize /home/Datasets/MSCRad4r/SMOKE_A0.bag --topic /oculii_radar/point_cloud
mkdir -p ~/kiss_ws/src
cd ~/kiss_ws/src
git clone --branch v1.3.0 https://github.com/PRBonn/kiss-icp.git
cd
cd kiss_ws
catkin build
df -h
source ~/catkin_ws/devel/setup.bash
source ~/kiss_ws/devel/setup.bash
docker ps
catkin_make
roslaunch kiss_icp odometry.launch topic:=/lidar/points
rospack find kiss_icp
source ~/kiss_ws/devel/setup.bash
rospack find kiss_icp
roslaunch kiss_icp odometry.launch topic:=/lidar/points
rospack find kiss_icp
roscd kiss_icp
find . -name "*.launch"
kiss_icp_pipeline --visualize /home/Datasets/MSCRad4r/SMOKE_A0.bag --topic /oculii_radar/point_cloud
kiss_icp_pipeline --visualize /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --topic /hugin_raf_1/radar_data
kiss_icp_pipeline --visualize /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_1.bag --topic /hugin_raf_1/radar_data
kiss_icp_pipeline --visualize /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_2.bag --topic /hugin_raf_1/radar_data
kiss_icp_pipeline --visualize /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_2.bag --topic /ouster/points
kiss_icp_pipeline --visualize /home/Datasets/MSCRad4r/SMOKE_A0.bag --topic /oculii_radar/point_cloud
kiss_icp_pipeline --visualize /home/Dataset
kiss_icp_pipeline --visualize /home/Datasets/MSCRad4r/SMOKE_A0.bag 
kiss_icp_pipeline --visualize /home/Datasets/MSCRad4r/SMOKE_A0.bag --topic /ouster/points
kiss_icp_pipeline --visualize /home/Datasets/MSCRad4r/SMOKE_B0.bag --topic /ouster/points
kiss_icp_pipeline --visualize /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
rosrun tf2_ros static_transform_publisher   0 0 0 0 0 0 base_link livox_frame &
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
roscore &
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
rosrun tf2_ros static_transform_publisher   0 0 0 0 0 0 base_link livox_frame &
kiss_icp_pipeline --visualize /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag
cd kiss_ws
git clone --branch v0.3.0 https://github.com/PRBonn/kiss-icp.git
colcon build
source ./install/setup.bash
catkin build
cd src
git clone --branch v0.3.0 https://github.com/PRBonn/kiss-icp.git
cd ..
catkin build
catkin init
catkin build
rm -rf build devel .catkin_tools
catkin init
cd
cd kiss_ws
catkin build
cd src
git clone --branch v0.3.0 https://github.com/PRBonn/kiss-icp.git
cd ..
catkin build
cd src
https://github.com/PRBonn/kiss-icp/tree/v0.3.0
git clone https://github.com/PRBonn/kiss-icp/tree/v0.3.0
catkin build
rviz &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
rosrun tf2_ros static_transform_publisher   0 0 0 0 0 0 base_link livox_frame &
rosnode kill -a
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
rosrun tf2_ros static_transform_publisher   0 0 0 0 0 0 base_link livox_frame &
cd ..
catkin build
source devel/setup.bash
roslaunch kiss_icp odometry.launch topic:=/livox/points/ &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch kiss_icp odometry.launch topic:=/radar_enchanced_pcl &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch kiss_icp odometry.launch topic:=/radar_enchanced_pcl &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
sudo apt install ros-noetic-point-cloud-converter
cd src
git clone https://github.com/pal-robotics-forks/point_cloud_converter
cd ..
catkin build
rosrun point_cloud_converter point_cloud_converter points2_in:=/radar_enhanced_pcl points_out:=/radar_enchanced_pcl2 &
source devel/setup.bash
rosrun point_cloud_converter point_cloud_converter points2_in:=/radar_enhanced_pcl points_out:=/radar_enchanced_pcl2 &
rosrun point_cloud_converter point_cloud_converter.launch points2_in:=/radar_enhanced_pcl points_out:=/radar_enchanced_pcl2 &
roscd point_cloud_converter
ls
rosrun point_cloud_converter point_cloud_converter.launch
cd ..
catkin build
source devel/setup.bash
rosrun point_cloud_converter point_cloud_converter.launch points2_in:=/radar_enhanced_pcl points_out:=/radar_enchanced_pcl2 &
source devel/setup.bash
rosrun point_cloud_converter point_cloud_converter.launch
roslaunch point_cloud_converter point_cloud_converter.launch
roslaunch point_cloud_converter point_cloud_converter.launch points2_in:=/radar_enhanced_pcl points_out:=/radar_enchanced_pcl2 &
roslaunch kiss_icp odometry.launch topic:=/radar_enchanced_pcl2 &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rviz &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosnode kill -a
roslaunch point_cloud_converter point_cloud_converter.launch points_in:=/radar_enhanced_pcl points2_out:=/radar_enchanced_pcl2 &
rviz &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosnode kill -a
roslaunch point_cloud_converter point_cloud_converter.launch points_in:=/radar_enhanced_pcl points2_out:=/radar_enchanced_pcl2 &
rviz &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch kiss_icp odometry.launch topic:=/radar_enchanced_pcl2 &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rviz &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_1.bag --clock
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
roslaunch kiss_icp odometry.launch topic:=/livox/points/ &
rosbag play /home/Datasets/NTU4DRadLM/smoke_2022-05-21_0.bag --clock
roslaunch kiss_icp odometry.launch topic:=/hugin_raf_1/radar_data &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch kiss_icp odometry.launch topic:=/ouster/points &
rosbag play /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_0.bag --clock
roslaunch kiss_icp odometry.launch topic:=/oculii_radar/point_cloud &
rosrun tf2_ros static_transform_publisher 0 0 0 0 0 0 base_link os_sensor &
rosrun tf2_ros static_transform_publisher 0 0 0 1.5708 3.14 1.5708 base_link oculii &
rosbag play /home/Datasets/MSCRad4r/SMOKE_A0.bag --clock 
roslaunch kiss_icp odometry.launch topic:=/ouster/points &
cd
cd kiss_ws
roslaunch kiss_icp odometry.launch topic:=/ouster/points &
source devel/setup.bash
roslaunch kiss_icp odometry.launch topic:=/ouster/points &
git clone https://github.com/cocel-postech/genz-icp.git
cd ..
cd kiss_ws
cd src
git clone https://github.com/cocel-postech/genz-icp.git
cd ..
catkin build genz_icp --cmake-args -DCMAKE_BUILD_TYPE=Release
source devel/setup.bash
roslaunch kiss_icp odometry.launch topic:=/livox/lidar &
rosnode kill -a
roscore &
rosnode kill -a
roslaunch kiss_icp odometry.launch topic:=/livox/lidar &
cd
cd kiss_ws
source devel/setup.bash
roslaunch kiss_icp odometry.launch topic:=/livox/lidar &
roslaunch kiss_icp odometry.launch topic:=/livox/points &
rosnode kill -a
cd
cd kiss_ws
source devel/setup.bash
roslaunch kiss_icp odometry.launch topic:=/livox/points &
rosnode ill -a
rosnode kill -a
cd
cd kiss_ws
source devel/setup.bash
roslaunch kiss_icp odometry.launch topic:=/livox/points &
rosnode kill -a
roslaunch kiss_icp odometry.launch topic:=/livox/points &
rosnode kill -a
cd
cd kiss_ws
source devel/setup.bash
roslaunch kiss_icp odometry.launch topic:=/livox/points &
rosode ill -a
rosnodekill -a
rosnode kill -a
rosnodekill -a
rosode ill -a
roslaunch kiss_icp odometry.launch topic:=/livox/points &
cd
cd kiss_ws
source devel/setup.bash
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 &
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 &
cd
cd kiss_ws
source devel/setup.bash
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 &
rosnode kill -a
cd
cd kiss_ws
source devel/setup.bash
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 &
roslaunch genz_icp odometry.launch topic:=/livox/points &
rosnode kill -a
roslaunch genz_icp odometry.launch topic:=/livox/points &
rosnode kill -a
cd
cd kiss_ws
source devel/setup.bash
roslaunch genz_icp odometry.launch topic:=/ouster/points
roslaunch genz_icp odometry.launch topic:=/hugin_raf_1/radar_data
cd
cd catkin_ws
roslaunch ig_lio lio_bg_velodyne.launch
roslaunch fast_lio mapping_horizon.launch 
rosbag info /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_1.bag
roslaunch fast_lio mapping_horizon.launch 
roslaunch fast_lio ouster64.launch 
roslaunch fast_lio mapping_ouster64.launch 
cd
cd kiss_ws
source devel/setup.bash
roslaunch kiss_icp odometry.launch topic:=/ouster/points
roslaunch kiss_icp odometry.launch topic:=/hugin_raf_1/radar_data
roslaunch kiss_icp odometry.launch topic:=/ouster/points
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2
roslaunch genz_icp odometry.launch topic:=/livox/points
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2
roslaunch kiss_icp odometry.launch topic:=/hugin_raf_1/radar_data
roslaunch kiss_icp odometry.launch topic:=/ouster/points
df -h
roslaunch kiss_icp odometry.launch topic:=/ouster/points
rviz &
roscore &
rviz &
rosrun livox_to_pointcloud2 livox_to_pointcloud2_node \_input_topic:=/livox/lidar     _output_topic:=/livox/points &
rosrun tf2_ros static_transform_publisher   0 0 0 0 0 0 base_link livox_frame &
rosbag play /home/Datasets/NTU4DRadLM/garden_2022-05-13_1.bag --clock
rosbag play /home/Datasets/NTU4DRadLM/garden_2022-05-13_0.bag --clock
rosbag play /home/Datasets/NTU4DRadLM/garden_2022-05-13_0.bag --clock --rate=3
rosbag play /home/Datasets/NTU4DRadLM/garden_2022-05-13_1.bag --clock --rate=4
rosbag play /home/Datasets/NTU4DRadLM/garden_2022-05-13_0.bag --clock --rate=5
cd
cd catkin_ws
cd src
git clone https://github.com/hku-mars/ikd-Tree
cd ..
catkin_make
source devel/setup.bash
df -h
pip install scipy
cd
cd catkin_ws
rosbag info /home/Datasets/Forest_Eskilstuna/Eskilstuna_Forest_1.bag
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
roslaunch fast_lio mapping_ouster64.launch 
roslaunch fast_lio mapping_horizon.launch 
cd ..
cd kiss_ws
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=ouster
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch genz_icp odometry.launch topic:=/hugin_raf_1/radar_data dataset_type:=ouster
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
topic_tools mux
sudo apt install ros-noetic-topic-tools
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster &
rostopic pub /active_points/select std_msgs/String "/hugin_raf_1/radar_data" -1
rostopic pub /active_points/select std_msgs/String "/hugin_raf_1/radar_data" -1
rostopic pub /active_points/select std_msgs/String "/livox/points" -1
rostopic pub /active_points/select std_msgs/String "/hugin_raf_1/radar_data" -1
rosnode kill -a
roscore &
rosnode kill -a
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
cd
cd kiss_ws
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
cd
cd catkin_ws
catkin_make
cd
cd kiss_ws
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
cd
cd catkin_ws
catkin_make
cd
cd kiss_ws
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=ouster
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
cd
rm -rf .git
cd kiss_ws
rm -rf .git
cd
cd catkin_ws
rm -rf .git
cd src
cd detection_alg
git init
git add .
git commit -m #Initial commit"
git commit -m "Initial commit"
cd
cd catkin_ws
cd src
cd detection_al
cd detection_alg
git init
git add .
git commit -m "Initial commit"
git config --global user.email "henriquejcgomes5@gmail.com"
git commit -m "Initial commit"
git remote add origin git@github.com/HenriqueJCG/Smoke_detector.git
git branch -M main
git push -u origin main
git remote add origin https://github.com/HenriqueJCG/Smoke_detector.git
git remove remote origin
git remote remove origin
git remote add origin https://github.com/HenriqueJCG/Smoke_detector.git
git branch -M main
git push -u origin main
cd catkin_ws/src
cd
find . -name ".git"
cd catkin_ws/ouster-ros
rm -rf .git
cd ouster-sdk
rm -rf .git
cd
find . -name ".git"
find . -name ".git" -exec rm -rf {} +
git rm --cached -r .
git add .
find . -name ".git"
cd kiss_ws
source devel/setup.bash
find . -name ".git"
cd src/genz-icp/
rm -rf .git
cd
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/HenriqueJCG/Smoke_detector.git
git remote -v
git push -u origin main
git push --force origin main
git branch -M main
git push --force origin main
git rm -r --cached build build_isolated devel devel_isolated .ros .vscode-server
git add .gitignore
git commit --amend
git add .gitignore
git add .
git commit -m "Remove generated files and add gitignore"
git reset --soft HEAD~1
git add .
git commit -m "Clean repository"
git push -u origin main --force
git rm -r --cached catkin_ws/build
git rm -r --cached catkin_ws/build_isolated
git rm -r --cached catkin_ws/devel
git rm -r --cached catkin_ws/devel_isolated
git rm -r --cached .ros
git rm -r --cached .vscode-server
printf "catkin_ws/build/\ncatkin_ws/build_isolated/\ncatkin_ws/devel/\ncatkin_ws/devel_isolated/\n.ros/\n.vscode-server/\n*.o\n*.log\n" >> .gitignore
git add .gitignore
git commit --amend
git push origin main --force
git init
git add .
git commit -m "First"
git push origin main --force
git reset
git add catkin_ws kiss_ws .gitignore
git status
git commit -m "Initial clean commit"
git push origin main --force
rm -rf .git
git init
git add catkin_ws kiss_ws .gitignore
git status
git commit -m "Clean initial commit"
git remote add origin https://github.com/HenriqueJCG/Smoke_detector.git
git branch -M main
git push -u origin main --force
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=ouster
roscore &
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=ouster
cd 
cd kiss_ws
source devel/setup.bash
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=ouster
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch genz_icp odometry.launch topic:=/hugin_raf_1/radar_data dataset_type:=ouster
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/oculii/point_cloud dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/oculii_radar/point_cloud dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/livox/points dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/radar_pcl2 dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/livox/points dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster128
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/livox/points dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster128
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster128
roslaunch kiss_icp odometry.launch topic:=/livox/points dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster128
roslaunch kiss_icp odometry.launch topic:=/livox/points dataset_type:=livox
catkin_make
roslaunch kiss_icp odometry.launch topic:=/livox/points dataset_type:=livox
catkin_make
roslaunch kiss_icp odometry.launch topic:=/livox/points dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster128
roslaunch kiss_icp odometry.launch topic:=/livox/points dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster128
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
rosnode kill -a
roscore &
rosnode kill -a
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/oculii_radar/point_cloud dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/oculii_radar/point_cloud dataset_type:=ouster128
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
rosnode kill -a
roscore &
rosnode kill -a
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/hugin_raf1_radar dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/hugin_raf_1/radar_data dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster128
roslaunch kiss_icp odometry.launch topic:=/oculii_eagle/radar_data dataset_type:=ouster128
roslaunch kiss_icp odometry.launch topic:=/oculii_radar/point_cloud dataset_type:=ouster128
roslaunch kiss_icp odometry.launch topic:=/oculii_radar/point_cloud dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch genz_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
chmod +x graph.py
graph.py
cd
chmod +x graph.py
graph.py
./graph.py
source devel/setup.bash
source /opt/ros/noetic/setup.bash
./graph.py
python3 graph.py
pip install pandas
python3 graph.py
pip install matplotlib
python3 graph.py
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
cd catkin_ws
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
source devel/setup.bash
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch genz_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
cd
source devel/setup.bash
source /opt/ros/noetic/setup.bash
python3 graph.py
roscore &
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
python3 graph.py
source /opt/ros/noetic/setup.bash
python3 graph.py
cd
python3 graph.py
cd catkin_ws
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
source devel/setup.bash
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
cd
python3 graph.py
roslaunch kiss_icp odometry.launch topic:=/radar_enhanced_pcl2 dataset_type:=livox
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster128
roslaunch kiss_icp odometry.launch topic:=/ouster/points dataset_type:=ouster
df -h
