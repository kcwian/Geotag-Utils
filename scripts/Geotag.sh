#!/bin/bash
pkill rosmaster
kill -9 $(lsof -ti:5000)
pkill node
sleep 2
export DISPLAY=:0;
source /opt/ros/noetic/setup.bash
source /home/pi/catkin_geotagger/devel/setup.bash
roslaunch run_main run_geotagger.launch
