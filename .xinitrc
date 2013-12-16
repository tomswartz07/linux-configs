syndaemon -t -k -i 2 -d &
synclient TouchpadOff=1
setxkbmap -option compose:ralt
export EDITOR=/usr/bin/vim
#exec awesome
#exec openbox-session
#exec gnome-session
#exec cinnamon-session
exec i3
