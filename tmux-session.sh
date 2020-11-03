#!/bin/bash

# Script to set up the default tmux session on main servers

if $(tmux has-session 2>/dev/null); then tmux -2u att; exit; fi
tmux new-session -d -n crunchy -s Server -c /home/tom
sleep 0.2
tmux send-keys -t Server:1.0 "echo mutt -F /home/tom/.mutt/accounts/crunchy" Enter
tmux select-layout -t Server:1 "b5de,273x80,0,0,1" > /dev/null
tmux new-window -n tomswartz07 -t Server:2 -c /home/tom
sleep 0.2
tmux send-keys -t Server:2.0 "echo mutt -F /home/tom/.mutt/accounts/tomswartz07" Enter
tmux select-layout -t Server:2 "db1f,273x80,0,0,20" > /dev/null
tmux new-window -n tswartz -t Server:3 -c /home/tom
sleep 0.2
tmux send-keys -t Server:3.0 "echo mutt -F /home/tom/.mutt/accounts/tswartz" Enter
tmux select-layout -t Server:3 "b5e0,273x80,0,0,3" > /dev/null
tmux new-window -n IRC -t Server:4 -c /home/tom
sleep 0.2
tmux send-keys -t Server:4.0 "weechat" Enter
tmux select-layout -t Server:4 "5b26,273x80,0,0,55" > /dev/null
tmux new-window -n zsh -t Server:5 -c /home/tom
sleep 0.2
tmux send-keys -t Server:5.0 "echo zsh" Enter
tmux select-layout -t Server:5 "b5e0,273x80,0,0,3" > /dev/null
tmux new-window -n apps -t Server:6 -c /home/tom
sleep 0.2
tmux send-keys -t Server:6.0 "ssh clusterpi02" Enter
tmux select-layout -t Server:6 "2232,273x80,0,0[273x40,0,0,5,273x39,0,41,6]" > /dev/null
tmux split-window -t Server:6 -c /home/tom
sleep 0.2
tmux send-keys -t Server:6.1 "ssh clusterpi03" Enter
tmux select-layout -t Server:6 "2232,273x80,0,0[273x40,0,0,5,273x39,0,41,6]" > /dev/null
tmux new-window -n postgres -t Server:7 -c /home/tom
sleep 0.2
tmux send-keys -t Server:7.0 "ssh pihole" Enter
tmux select-layout -t Server:7 "e357,273x80,0,0[273x40,0,0{136x40,0,0,7,136x40,137,0[136x20,137,0{68x20,137,0,27,67x20,206,0,30},136x19,137,21{68x19,137,21,28,67x19,206,21,29}]},273x39,0,41{136x39,0,41,24,136x39,137,41[136x19,137,41,25,136x19,137,61,26]}]" > /dev/null
tmux split-window -t Server:7 -c /home/tom
sleep 0.2
tmux send-keys -t Server:7.1 "ssh pihole" Enter
tmux select-layout -t Server:7 "e357,273x80,0,0[273x40,0,0{136x40,0,0,7,136x40,137,0[136x20,137,0{68x20,137,0,27,67x20,206,0,30},136x19,137,21{68x19,137,21,28,67x19,206,21,29}]},273x39,0,41{136x39,0,41,24,136x39,137,41[136x19,137,41,25,136x19,137,61,26]}]" > /dev/null
tmux split-window -t Server:7 -c /home/tom
sleep 0.2
tmux send-keys -t Server:7.2 "ssh pihole" Enter
tmux select-layout -t Server:7 "e357,273x80,0,0[273x40,0,0{136x40,0,0,7,136x40,137,0[136x20,137,0{68x20,137,0,27,67x20,206,0,30},136x19,137,21{68x19,137,21,28,67x19,206,21,29}]},273x39,0,41{136x39,0,41,24,136x39,137,41[136x19,137,41,25,136x19,137,61,26]}]" > /dev/null
tmux split-window -t Server:7 -c /home/tom
sleep 0.2
tmux send-keys -t Server:7.3 "ssh clusterpi00" Enter
tmux select-layout -t Server:7 "e357,273x80,0,0[273x40,0,0{136x40,0,0,7,136x40,137,0[136x20,137,0{68x20,137,0,27,67x20,206,0,30},136x19,137,21{68x19,137,21,28,67x19,206,21,29}]},273x39,0,41{136x39,0,41,24,136x39,137,41[136x19,137,41,25,136x19,137,61,26]}]" > /dev/null
tmux split-window -t Server:7 -c /home/tom
sleep 0.2
tmux send-keys -t Server:7.4 "ssh clusterpi00" Enter
tmux select-layout -t Server:7 "e357,273x80,0,0[273x40,0,0{136x40,0,0,7,136x40,137,0[136x20,137,0{68x20,137,0,27,67x20,206,0,30},136x19,137,21{68x19,137,21,28,67x19,206,21,29}]},273x39,0,41{136x39,0,41,24,136x39,137,41[136x19,137,41,25,136x19,137,61,26]}]" > /dev/null
tmux split-window -t Server:7 -c /home/tom
sleep 0.2
tmux send-keys -t Server:7.5 "ssh clusterpi00" Enter
tmux select-layout -t Server:7 "e357,273x80,0,0[273x40,0,0{136x40,0,0,7,136x40,137,0[136x20,137,0{68x20,137,0,27,67x20,206,0,30},136x19,137,21{68x19,137,21,28,67x19,206,21,29}]},273x39,0,41{136x39,0,41,24,136x39,137,41[136x19,137,41,25,136x19,137,61,26]}]" > /dev/null
tmux split-window -t Server:7 -c /home/tom
sleep 0.2
tmux send-keys -t Server:7.6 "ssh pihole" Enter
tmux select-layout -t Server:7 "e357,273x80,0,0[273x40,0,0{136x40,0,0,7,136x40,137,0[136x20,137,0{68x20,137,0,27,67x20,206,0,30},136x19,137,21{68x19,137,21,28,67x19,206,21,29}]},273x39,0,41{136x39,0,41,24,136x39,137,41[136x19,137,41,25,136x19,137,61,26]}]" > /dev/null
tmux split-window -t Server:7 -c /home/tom
sleep 0.2
tmux send-keys -t Server:7.7 "ssh clusterpi00" Enter
tmux select-layout -t Server:7 "e357,273x80,0,0[273x40,0,0{136x40,0,0,7,136x40,137,0[136x20,137,0{68x20,137,0,27,67x20,206,0,30},136x19,137,21{68x19,137,21,28,67x19,206,21,29}]},273x39,0,41{136x39,0,41,24,136x39,137,41[136x19,137,41,25,136x19,137,61,26]}]" > /dev/null
tmux new-window -n htop -t Server:8 -c /home/tom
sleep 0.2
tmux send-keys -t Server:8.0 "ssh clusterpi00" Enter
tmux select-layout -t Server:8 "6882,273x80,0,0{136x80,0,0[136x40,0,0,15,136x39,0,41,16],136x80,137,0[136x40,137,0,17,136x39,137,41,18]}" > /dev/null
tmux split-window -t Server:8 -c /home/tom
sleep 0.2
tmux send-keys -t Server:8.1 "ssh clusterpi02" Enter
tmux select-layout -t Server:8 "6882,273x80,0,0{136x80,0,0[136x40,0,0,15,136x39,0,41,16],136x80,137,0[136x40,137,0,17,136x39,137,41,18]}" > /dev/null
tmux split-window -t Server:8 -c /home/tom
sleep 0.2
tmux send-keys -t Server:8.2 "ssh clusterpi01" Enter
tmux select-layout -t Server:8 "6882,273x80,0,0{136x80,0,0[136x40,0,0,15,136x39,0,41,16],136x80,137,0[136x40,137,0,17,136x39,137,41,18]}" > /dev/null
tmux split-window -t Server:8 -c /home/tom
sleep 0.2
tmux send-keys -t Server:8.3 "ssh clusterpi03" Enter
tmux select-layout -t Server:8 "6882,273x80,0,0{136x80,0,0[136x40,0,0,15,136x39,0,41,16],136x80,137,0[136x40,137,0,17,136x39,137,41,18]}" > /dev/null
tmux new-window -n covid -t Server:9 -c /home/tom
sleep 0.2
tmux send-keys -t Server:9.0 "echo sleep 600" Enter
tmux select-layout -t Server:9 "e38c,273x80,0,0{136x80,0,0,19,136x80,137,0,20}" > /dev/null
tmux split-window -t Server:9 -c /home/tom/git/covid19-pa
sleep 0.2
tmux send-keys -t Server:9.1 "echo -zsh" Enter
tmux select-layout -t Server:9 "e38c,273x80,0,0{136x80,0,0,19,136x80,137,0,20}" > /dev/null
tmux new-window -n covid -t Server:10 -c /home/tom/git/nytimes-covid19-data
sleep 0.2
tmux send-keys -t Server:10.0 "echo -zsh" Enter
tmux select-layout -t Server:10 "db20,273x80,0,0,21" > /dev/null
tmux new-window -t Server:11 -c /home/tom/git/qmk_firmware
sleep 0.2
tmux send-keys -t Server:11.0 "echo -zsh" Enter
tmux select-layout -t Server:11 "5b27,273x80,0,0,18" > /dev/null
tmux new-window -t Server:12 -c /home/tom
sleep 0.2
tmux send-keys -t Server:12.0 "echo -zsh" Enter
tmux select-layout -t Server:12 "5b27,273x80,0,0,56" > /dev/null
tmux -2u att
