#!/usr/bin/env bash

# create window
tmux start-server
tmux new-session -d -s lcd -n work

# split window to 6 pane
tmux select-window -t lcd
tmux split-window -v -p 50
tmux split-window -h -p 66
tmux split-window -h -p 50
tmux select-pane -t:.1
tmux split-window -h -p 66
tmux split-window -h -p 50

# config panes
tmux select-window -t lcd:work

tmux send-keys -t:.1 "ls -l" C-m
tmux send-keys -t:.2 "ls -l" C-m
tmux send-keys -t:.3 "ls -l" C-m
tmux send-keys -t:.4 "ls -l" C-m
tmux send-keys -t:.5 "ls -l" C-m
tmux send-keys -t:.6 "ls -l" C-m

# start
tmux select-window -t lcd:work
tmux attach-session -t lcd
