xset s activate
xset b off
xrdb -load .Xresources
syndaemon -t -k -i 2 -d &
synclient TouchpadOff=1
setxkbmap -option compose:ralt
setxkbmap -option caps:escape
export EDITOR=/usr/bin/vim
#exec awesome
#exec openbox-session
#exec gnome-session
#exec cinnamon-session
exec i3
