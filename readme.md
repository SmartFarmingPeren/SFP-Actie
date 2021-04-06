# Why ROS-Melodic?
ROS-industrial has binary support up to ROS-melodic. ROS-industrial can support noetic when build from source, but this would lead to a less reliable code base. Another reason not to use ROS-noetic is because this is not supported by the Universal robot package that is used by MoveIt. ROS-noetic needs to run on Ubuntu 18.04 because newer ubuntu versions aren't supported by the MoveIt-noetic package.

# Installation

## Installing Ubuntu 18.04 as a VM on Virtual Box 
(A host machine with at least 8GB or RAM and 8 CPU cores is recommended)

1. Download `VirtualBox Image (Size 3.1GB)` [here](https://www.linuxvmimages.com/images/ubuntu-1804/).
2. Extract the downloaded `Ubuntu_18.04.5_VB_LinuxVMImages.com.ova` file to anywhere.
3. Open the Virtual Box application
4. Go to File > import appliance and select the `Ubuntu_18.04.5_VB_LinuxVMImages.com.ova` file that you extracted.
5. Go to the machine's settings, then to `System`.
    - On the motherboard tab, change "Base Memory" to atleast 4096MB 
    - On the Processors tab, change Processor(s) to atleast 3/4 CPUs
6. click `Okay` to save and exit the settings.
7. Start the Machine (if you get a network adapter error while starting the VM, select `Change Network Settings` and choose `NAT` from the first drop-down list and click `Okay`
8. Once the VM has started up, login username: "Ubuntu", password: "ubuntu"

### Installing ROS and MoveIt in Ubuntu 18.04
1. Install git on your machine if you haven't done so already. (you can use [this](https://gist.github.com/derhuerst/1b15ff4652a867391f03#installing-git-on-linux) guide if you are stuck).
2. Clone the `SFP-Actie` to your machine.
3. Open the terminal, navigate to the newly created folder and execute `chmod +x install-melodic.sh`.
4. Then install MoveIt, ROS and ROS-Industrial by running './install-melodic.sh' (this can take a while).


Now you should have ROS and MoveIt installed correctly on your machine!
