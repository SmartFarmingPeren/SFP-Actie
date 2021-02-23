# install curl
sudo apt update -y && sudo apt install -y curl gnupg2 lsb-release git

# setup sources.list

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# setup keys
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -

# update debian package index
sudo apt update

# install melodic
sudo apt install -y 'ros-melodic-desktop-full'

# Environment setup
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
. ~/.bashrc
. /opt/ros/melodic/setup.bash

# Dependencies for building packages
sudo apt install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

# Initialize rosdep
sudo apt install -y python-rosdep

sudo rosdep init
rosdep update
sudo apt-get update -y
sudo apt-get dist-upgrade -y

sudo apt-get install -y ros-melodic-catkin python-catkin-tools

# Install moveit Kinetic
sudo apt install -y ros-melodic-moveit

mkdir -p ~/ws_moveit/src

cd ~/ws_moveit/src
git clone https://github.com/ros-planning/moveit_tutorials.git -b melodic-devel
git clone https://github.com/ros-planning/panda_moveit_config.git -b melodic-devel

cd ~/ws_moveit/src
rosdep install -y --from-paths . --ignore-src --rosdistro melodic

cd ~/ws_moveit
catkin config --extend /opt/ros/${ROS_DISTRO} --cmake-args -DCMAKE_BUILD_TYPE=Release
catkin build

echo 'source ~/ws_moveit/devel/setup.bash' >> ~/.bashrc
. ~/ws_moveit/devel/setup.bash

# Install ROS-industrial
sudo apt-get install -y ros-melodic-industrial-core
sudo apt-get install -y ros-melodic-abb
sudo apt-get install -y ros-melodic-ros-canopen

# Install Universal Robot
mkdir -p ~/catkin_ws/src

cd ~/catkin_ws/src

# retrieve the sources (replace '$ROS_DISTRO' with the ROS version you are using)
git clone -b melodic-devel https://github.com/ros-industrial/universal_robot.git

cd ~/catkin_ws

# checking dependencies (again: replace '$ROS_DISTRO' with the ROS version you are using)
rosdep update
rosdep install --rosdistro melodic --ignore-src --from-paths src

. /opt/ros/melodic/setup.bash

# building
catkin_make

# activate this workspace
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
. ~/.bashrc
