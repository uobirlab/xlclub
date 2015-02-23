#!/bin/bash

SESSION=gmapping

tmux -2 new-session -d -s $SESSION

tmux new-window -t $SESSION:0 -n 'gmapping'
tmux new-window -t $SESSION:1 -n 'map_saver'

tmux select-window -t $SESSION:0
tmux send-keys "roslaunch --wait ~/xl/launch/gmapping.launch" C-m

tmux select-window -t $SESSION:1
tmux send-keys "rosrun map_server map_saver -f /tmp/xl_map"


# Set default window
tmux select-window -t $SESSION:0

tmux setw -g mode-mouse on

# Attach to session
tmux -2 attach-session -t $SESSION



