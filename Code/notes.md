## create catkin workspace:

` mkdir -p *projectname*/src`

Install package dependencies not already in your workspace:

`rosdep install -y --from-paths . --ignore-src --rosdistro melodic`

Configure catking workspace:

```sh
cd *projectname*
catkin config --extend /opt/ros/melodic --cmake-args -DCMAKE_BUILD_TYPE=Release
catkin build
```

Source the catkin workspace[2]:

```sh
source *projectname*/devel/setup.bash
```

to launch the project:

```sh
roslaunch *projectname* *launchfile*.launch
```

example: `roslaunch ur10e_moveit_config demo.launch` roslaunch contains autocomplete for loaded catkin workspaces.[5]
Only 1 catkin workspace can be sourced at a time.[7]


## Sources:

1. [ROS melodic Installation](http://wiki.ros.org/melodic/Installation/Ubuntu)
2. [Moveit Installation](http://docs.ros.org/en/melodic/api/moveit_tutorials/html/doc/getting_started/getting_started.html)
3. [ROS-industrial Installation](http://wiki.ros.org/Industrial/Install)
4. [Universal Robot for ROS-industrial](https://github.com/ros-industrial/universal_robot)
5. [MoveIt setup_assistant tutorial](https://www.youtube.com/watch?v=9aK0UDBKWT8)
6. [Convert xarco file to urdf](https://answers.ros.org/question/10401/how-to-convert-xacro-file-to-urdf-file/)
7. [Several catkin workspaces](https://answers.ros.org/question/175234/several-catkin-workspaces/)