### Create a new package for ROS:

> ros2 pkg create *my_package* --build-type ament_cmake --dependencies rclcpp

Creates a folder called *my_package* in current directory

rclcpp is the ros-core-library for C++, this is a standard dependency 

Add a launch folder into the new ros2 package.
Add a launch file called **name**.launch.py to keep convention.

### Compile newly created ROS package

Run from main project directory:
> colcon build --symlink-install --packages-select *my_package*

After building the package source `install/setup.bash`

### Launch simulation

> ros2 launch *my_package* **name**.launch.py

Where **name** is the name of the launch file previously made in the launch folder


### gazebo trouble

If the gazebo crashes or you see a log with `"[gazebo-] process has dies [pid , exit code **255**],`
then you might want to try to `source /usr/share/gazebo/setup.sh` and use `killall gzserver`, `killall gzclient`
