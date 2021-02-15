
- [Installation](#installation)
		- [1.1 Docker](#11-docker)
			- [Fix Ram Issue](#fix-ram-issue)
					- [source](#source)
			- [Limit max RAM usage](#limit-max-ram-usage)
		- [1.2 Install Vcxsrv](#12-install-vcxsrv)
		- [1.3 Install VS Code](#13-install-vs-code)
		- [1.4 Install Git](#14-install-git)
	- [2. Building](#2-building)
	- [4. Running](#4-running)
	- [5. Testing](#5-testing)
	- [6. GUI support](#6-gui-support)
- [Task description](#task-description)

# Installation

### 1.1 [Docker](https://docs.docker.com/docker-for-windows/install/)
Install docker desktop. This might give an error about WSL2. Follow the given instructions to fix this.

#### Fix [Ram Issue](https://github.com/microsoft/WSL/issues/4166)
Open the WSL shell
Run `sudo crontab -e -u root`, add the following to `drop_cache` automatically every 15 min:
```
*/15 * * * * sync; echo 3 > /proc/sys/vm/drop_caches; touch /root/drop_caches_last_run
```

Add the following to your `~/.bashrc` file to start `cron` service automatically:
```
[ -z "$(ps -ef | grep cron | grep -v grep)" ] && sudo /etc/init.d/cron start &> /dev/null
```

To allow starting cron service without asking by root password, run `sudo visudo` and add:

```
%sudo ALL=NOPASSWD: /etc/init.d/cron start
```

To check when did you last clear your caches, run:

```
sudo stat -c '%y' /root/drop_caches_last_run
```
###### [source](https://github.com/Adriankhl/wsl2-xwin-audio)

#### Limit max RAM usage
Go to `C:\users\**YourUsername**` and create a `.wslconfig` file.
Add the following to the file. Customize max memory usage for your setup
```
[wsl2]
memory=6GB
swap=0
localhostForwarding=true
```

### 1.2 Install [Vcxsrv](https://sourceforge.net/projects/vcxsrv/) 

Follow the installation instructions. __Do not start an instance of Vcxsrv.__

### 1.3 Install [VS Code](https://code.visualstudio.com/)
Install VS Code, follow the instructions.
Launch VS Code and install the following extensions:

* [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
* [Docker explorer](https://marketplace.visualstudio.com/items?itemName=formulahendry.docker-explorer)
* [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
* [Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare)

You can install other extensions for themes and code support as you like. These are required for a minimal working setup.

### 1.4 Install [Git](https://git-scm.com/)
Install Git. You can choose to use VS Code as your default editor. I would recommend the default settings.

## 2. Building
Clone the github repository to a folder:
> git clone https://github.com/SmartFarmingPeren/SFP-Actie.git

Open the folder in VS code. You can use `Ctrl + p` to open the command palette. Type `>Run Task` an option `Tasks: Run Task` should show up. Select it and press Enter.

5 tasks show up:
* `Build docker image`
* `Open docker container`
* `Run docker image`
* `Stop docker container`
* `Stop all running docker containers`

The most used tasks will be:
* `Build docker image`
* `Run docker image`

For now build the docker image using the `Build docker image` task. For a full description see: [Task description](#task-description)

The first time build of a docker image will take a long time. This is caused by size of the MoveIt2 source package. The resulting docker image will be approximately 12GB. You can view all local docker images in the docker desktop application.

## 4. Running

To use the docker image use the `Run docker image` task.
This will open a CLI in vscode which is connected to the docker container. The docker image is based on Ubuntu 20. If you want to open the docker container in VS Code you can use the command palette and the Docker explorer extension.

Open the command palette with `Ctrl + p` Type: `>Remote-Container` and press Enter. Keep in mind that you need a running docker container to attach to.

## 5. Testing

When you are inside the docker container. Either through VS Code or through CLI you can run the build application and test it as if running it through the Ubuntu OS.

## 6. GUI support

If need be for a GUI or other graphical application run from the docker container simply open the `config.xlaunch`. This will open a Vcxsrv instance, or Xserver. You can close the Xserver from the system tray.

While the Xserver is open you can run Graphical applications from the docker container as if you would on a normal ubuntu desktop. Do keep in mind that there is no hardware acceleration support. This means that all graphical computation is done on the CPU instead of the GPU.

There exists an Nvidia container toolkit that allows users to build and run GPU accelerated docker containers. This however is currently only available on Ubuntu and not on windows. - [Nvidia-Docker](https://github.com/NVIDIA/nvidia-docker)

# Task description

Task Name | Task Description | Arguments
----------|----------------- | ----------
Build docker image | Builds the docker image, Can be used to run containers | None
Open docker container | Opens a running docker container. | Name:Tag of running container
Run docker image | Creates a docker container from pre-build docker image and enters it. | Name:Tag of docker image
Stop docker container | Stops a running docker container. | Name:Tag of running container
Stop all running docker containers | Stops all running docker containers | None