#!/bin/sh

# setup sources:
sudo apt update -y && sudo apt install -y curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# add the repository to your sources list
sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

# install ros2 desktop
sudo apt update
sudo apt install ros-foxy-desktop

# add ros2 to bashrc
echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
. ~/.bashrc

# install development tools and ROS tools
sudo apt install -y python3-pip
pip3 install -U argcomplete

sudo apt update && sudo apt install -y \
  build-essential \
  cmake \
  git \
  libbullet-dev \
  python3-colcon-common-extensions \
  python3-flake8 \
  python3-pip \
  python3-pytest-cov \
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
  wget
# install some pip packages needed for testing
python3 -m pip install -U \
  argcomplete \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  pytest-repeat \
  pytest-rerunfailures \
  pytest
# install Fast-RTPS dependencies
sudo apt install --no-install-recommends -y \
  libasio-dev \
  libtinyxml2-dev
# install Cyclone DDS dependencies
sudo apt install --no-install-recommends -y \
  libcunit1-dev

# Get ROS 2 code
mkdir -p ~/ros2_foxy/src
cd ~/ros2_foxy
wget https://raw.githubusercontent.com/ros2/ros2/foxy/ros2.repos
vcs import src < ros2.repos

# install dependencies using rosdep
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro foxy -y --skip-keys "console_bridge fastcdr fastrtps rti-connext-dds-5.3.1 urdfdom_headers"

# Create Workspace and Source for MoveIt2
export COLCON_WS=~/ws_ros2
mkdir -p $COLCON_WS/src
cd $COLCON_WS/src

# Download source code
wget https://raw.githubusercontent.com/ros-planning/moveit2/main/moveit2.repos
vcs import < moveit2.repos
rosdep install -r --from-paths . --ignore-src --rosdistro foxy -y

# Build MoveIt
. ~/.bashrc
cd $COLCON_WS
colcon build --event-handlers desktop_notification- status- --cmake-args -DCMAKE_BUILD_TYPE=Release

# Add MoveIt to bashrc
echo "source $COLCON_WS/install/setup.bash" >> ~/.bashrc
. ~/.bashrc

# install Gazebo
curl -sSL http://get.gazebosim.org | sh
sudo apt install ros-foxy-gazebo-ros-pkgs -y

echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc
