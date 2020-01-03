#!/usr/bin/env bash

# create window
tmux start-server
tmux new-session -d -s Workspace -n work

# split window to 4 panes
tmux select-window -t Workspace
tmux split-window -v -p 50
tmux select-pane -t:.1
tmux split-window -h -p 50
tmux select-pane -t:.3
tmux split-window -h -p 50

# config panes
tmux select-window -t Workspace:work

tmux send-keys -t:.1 "cd ~/Workspace" C-m
sleep 0.1
tmux send-keys -t:.1 "" C-m

tmux send-keys -t:.2 "cd ~/Workspace" C-m
sleep 0.1
tmux send-keys -t:.2 "" C-m

tmux send-keys -t:.3 "cd ~/Workspace" C-m
sleep 0.1
tmux send-keys -t:.3 "" C-m

tmux send-keys -t:.4 "cd ~/Workspace" C-m
sleep 0.1
tmux send-keys -t:.4 "" C-m

# start
tmux select-window -t Workspace:work
tmux attach-session -t Workspace
