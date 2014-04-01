xset s on
xset b off
syndaemon -t -k -i 2 -d &
synclient TouchpadOff=1
setxkbmap -option compose:ralt
setxkbmap -option caps:escape
export EDITOR=/usr/bin/vim
[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources
#exec awesome
#exec openbox-session
#exec gnome-session
#exec cinnamon-session
exec i3
