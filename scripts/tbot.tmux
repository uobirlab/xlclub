#!/bin/bash

SESSION=tbot_core

tmux -2 new-session -d -s $SESSION

tmux new-window -t $SESSION:0 -n 'roscore'
tmux new-window -t $SESSION:1 -n 'robot'
tmux new-window -t $SESSION:2 -n 'cam'
tmux new-window -t $SESSION:3 -n 'teleop'

tmux select-window -t $SESSION:0
tmux send-keys "roscore" C-m

tmux select-window -t $SESSION:1
tmux send-keys "roslaunch --wait turtlebot_bringup minimal.launch" C-m

tmux select-window -t $SESSION:2
tmux send-keys "roslaunch --wait turtlebot_bringup 3dsensor.launch" C-m

tmux select-window -t $SESSION:3
tmux send-keys "roslaunch --wait turtlebot_teleop logitech.launch" C-m



# Set default window
tmux select-window -t $SESSION:1

tmux setw -g mode-mouse on

# Attach to session
tmux -2 attach-session -t $SESSION



