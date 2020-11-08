#!/usr/bin/env bash

# 创建 workspace，同时分割成4个窗口

# create window
tmux start-server
tmux new-session -d -s workspace -n work

# split window to 4 panes
tmux select-window -t workspace
tmux split-window -v -p 50
tmux select-pane -t:.1
tmux split-window -h -p 50
tmux select-pane -t:.3
tmux split-window -h -p 50

# config panes
tmux select-window -t workspace:work

tmux send-keys -t:.1 "pwd" C-m
#sleep 0.1
#tmux send-keys -t:.1 "" C-m

tmux send-keys -t:.2 "pwd" C-m
#sleep 0.1
#tmux send-keys -t:.2 "" C-m

tmux send-keys -t:.3 "pwd" C-m
#sleep 0.1
#tmux send-keys -t:.3 "" C-m

tmux send-keys -t:.4 "pwd" C-m
#sleep 0.1
#tmux send-keys -t:.4 "" C-m

# start
tmux select-window -t workspace:work
tmux attach-session -t workspace
