# Why ROS-Melodic
ROS-industrial has binary support up to ROS-melodic. ROS-industrial can support noetic when build from source, but this would lead to a less reliable code base. Another reason not to use ROS-noetic is because this is not supported by the Universal robot package that is used by MoveIt. ROS-noetic needs to run on Ubuntu 18.04 because newer ubuntu versions aren't supported by the MoveIt-noetic package.

# Installation
## Ubuntu 18.04

Clone the github repository.
Execute `chmod +x install-melodic.sh` in the newly cloned directory.
Run `./install-melodic.sh` to install ROS and MoveIt and ROS-industrial.


