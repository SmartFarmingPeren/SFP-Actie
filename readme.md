

- [Installation](#installation)
	- [1. Applications](#1-Applications)
		- [1.1 Docker](#11-docker)
		- [1.2 Install Vcxsrv](#12-install-vcxsrv)
		- [1.3 Install VS Code](#13-install-vs-code)
		- [1.4 Install Git](#14-install-git)
	- [2. Building](#2-building)
	- [4. Running](#4-running)
	- [5. Testing](#5-testing)
	- [6. GUI support](#6-gui-support)
- [Task description](#task-description)

# Why ROS-Melodic
ROS-industrial has binary support up to ROS-melodic. ROS-industrial can support noetic when build from source, but this would lead to a less reliable code base. Another reason not to use ROS-noetic is because this is not supported by the Universal robot package that is used by MoveIt. ROS-noetic needs to run on Ubuntu 18.04 because newer ubuntu versions aren't supported by the MoveIt-noetic package.

# Installation
## Ubuntu 18.04

Clone the github repository.
Execute `chmod +x install-melodic.sh` in the newly cloned directory.
Run `./install-melodic.sh` to install ROS and MoveIt and ROS-industrial.


