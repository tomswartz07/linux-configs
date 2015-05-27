xset s on
xset b off
syndaemon -t -k -i 2 -d &
synclient TouchpadOff=1
synclient TapButton3=2
setxkbmap -option compose:ralt
setxkbmap -option caps:escape
export EDITOR=/usr/bin/vim
#xrandr --output VGA1 --auto --rotate left --primary --output HDMI1 --rotate left --auto --right-of VGA1 # zaphod
#xrandr --output DVI-0 --right-of HDMI-0 --mode 1366x768 --output HDMI-0 --primary --mode 1920x1080 # magrathea
#xrandr --output eDP1 --auto --primary # heimdall
[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources
#exec awesome
#exec openbox-session
#exec gnome-session
#exec cinnamon-session
exec i3
