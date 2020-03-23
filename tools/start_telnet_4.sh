#!/usr/bin/env bash

# create window
tmux start-server
tmux new-session -d -s telnet4 -n work

# split window to 6 pane
tmux select-window -t telnet4
tmux split-window -v -p 50
tmux select-pane -t:.1
tmux split-window -h -p 50
tmux select-pane -t:.3
tmux split-window -h -p 50

# config panes
tmux select-window -t telnet4:work

tmux send-keys -t:.1 "telnet 192.168.10.130" C-m
sleep 0.2
tmux send-keys -t:.1 "root" C-m
sleep 0.1
tmux send-keys -t:.1 "" C-m
tmux send-keys -t:.1 "cd /usr/local/bin/" C-m

tmux send-keys -t:.2 "telnet 192.168.10.131" C-m
sleep 0.2
tmux send-keys -t:.2 "root" C-m
sleep 0.1
tmux send-keys -t:.2 "" C-m
tmux send-keys -t:.2 "cd /usr/local/bin/" C-m

tmux send-keys -t:.3 "telnet 192.168.10.132" C-m
sleep 0.2
tmux send-keys -t:.3 "root" C-m
sleep 0.1
tmux send-keys -t:.3 "" C-m
tmux send-keys -t:.3 "cd /usr/local/bin" C-m

tmux send-keys -t:.4 "telnet 192.168.10.133" C-m
sleep 0.2
tmux send-keys -t:.4 "root" C-m
sleep 0.1
tmux send-keys -t:.4 "" C-m
tmux send-keys -t:.4 "cd /usr/local/bin" C-m

# start
tmux select-window -t telnet4:work
tmux attach-session -t telnet4
