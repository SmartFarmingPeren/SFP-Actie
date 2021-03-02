# Why ROS-Melodic
ROS-industrial has binary support up to ROS-melodic. ROS-industrial can support noetic when build from source, but this would lead to a less reliable code base. Another reason not to use ROS-noetic is because this is not supported by the Universal robot package that is used by MoveIt. ROS-noetic needs to run on Ubuntu 18.04 because newer ubuntu versions aren't supported by the MoveIt-noetic package.

# Installation
## Ubuntu 18.04

Clone the github repository.
Execute `chmod +x install-melodic.sh` in the newly cloned directory.
Run `./install-melodic.sh` to install ROS and MoveIt and ROS-industrial.

# Tips for runnin Ubuntu in Virtual Machine.

1. Have the 6.1 Oracle VM VirtualBox extension pack downloaded on your host and on your Virtal Machine. You can download the extension pack [here](https://www.virtualbox.org/wiki/Downloads).
2. When running a Virtual machine have at least 4gb base Memory and 3 or more processors assigned.

### How to instal the extension pack on your vm machine:
---
Start the virtual machine, open an terminal and run:
```
sudo apt-get install -y make perl gcc
```
When the installation is done insert the guest addition cd image

### Select your ram and cpu count:
---
Select settings on your host machine VM manager, for memory go to:
```
Settings->system->Motherboard->Base Memory = 4gb
```
The number of processors is on a fresh install just one. To have a better experience jusing Ubuntu, and especially the simulation select more cpu's, never give more than half of the cpu cores your computer has. For selecting the number of cpu's go to:
```
Settings->system->Processor->Processor(s) = 3/4
```



