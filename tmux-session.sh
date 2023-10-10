#!/bin/bash

# Script to set up the default tmux session on main servers

if $(tmux has-session 2>/dev/null); then tmux -2u att; exit; fi
tmux new-session -d -n crunchy -s Server -c /home/tom
sleep 0.2
tmux send-keys -t Server:1.0 "echo mutt -F /home/tom/.mutt/accounts/crunchy" Enter
tmux select-layout -t Server:1 "b5dd,273x80,0,0,0" > /dev/null
tmux new-window -n tomswartz07 -t Server:2 -c /home/tom
sleep 0.2
tmux send-keys -t Server:2.0 "echo mutt -F /home/tom/.mutt/accounts/tomswartz07" Enter
tmux select-layout -t Server:2 "b5de,273x80,0,0,1" > /dev/null
tmux new-window -n tswartz -t Server:3 -c /home/tom
sleep 0.2
tmux send-keys -t Server:3.0 "echo mutt -F /home/tom/.mutt/accounts/tswartz" Enter
tmux select-layout -t Server:3 "b5df,273x80,0,0,2" > /dev/null
tmux new-window -n IRC -t Server:4 -c /home/tom
sleep 0.2
tmux send-keys -t Server:4.0 "weechat" Enter
tmux select-layout -t Server:4 "b5e0,273x80,0,0,3" > /dev/null
tmux new-window -n zsh -t Server:5 -c /home/tom
sleep 0.2
tmux send-keys -t Server:5.0 "echo zsh" Enter
tmux select-layout -t Server:5 "b5e1,273x80,0,0,4" > /dev/null
tmux new-window -n apps -t Server:6 -c /home/tom
sleep 0.2
tmux send-keys -t Server:6.0 "ssh -t clusterpi02 tmux attach" Enter
tmux select-layout -t Server:6 "2232,273x80,0,0[273x40,0,0,5,273x39,0,41,6]" > /dev/null
tmux new-window -n zsh -t Server:7 -c /home/tom
sleep 0.2
tmux send-keys -t Server:7.0 "echo -zsh" Enter
tmux select-layout -t Server:7 "d1ea,731x108,0,0,23" > /dev/null
tmux new-window -n zsh -t Server:8 -c /home/tom
sleep 0.2
tmux send-keys -t Server:8.0 "echo -zsh" Enter
tmux select-layout -t Server:8 "d1ef,731x108,0,0,28" > /dev/null
tmux -2u att
