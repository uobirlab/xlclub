mkdir -p ~/xlclub_ws/src
cd ~/xlclub_ws/src
catkin_init_workspace
cd ..
wstool init -t src ~/xl/xlclub.rosinstall
catkin_make

