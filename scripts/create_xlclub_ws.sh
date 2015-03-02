mkdir -p ~/xlclub_ws/src
cd ~/xlclub_ws/src
catkin_init_workspace
cd ..
wstool init -j8 src ~/xl/scripts/xlclub.rosinstall
catkin_make

