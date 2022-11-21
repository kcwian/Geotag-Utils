#!/bin/bash
pkill rosmaster
kill -9 $(lsof -ti:5000)
pkill node
sleep 2
export DISPLAY=:0;
export FLASK_DEBUG=development
export TMPDIR=/home/pi/Expo/expo_cache
source /opt/ros/noetic/setup.bash
source /home/pi/catkin_geotagger/devel/setup.bash
roslaunch run_main run_dgps_only.launch &
cd /home/pi/Expo/ExpoGeotagger-FlaskServer/ && python3 app.py &
cd /home/pi/Expo/ExpoGeotagger && expo start --no-dev
