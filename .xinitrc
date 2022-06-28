xset s on
xset b off
#syndaemon -t -k -i 2 -d &
#synclient TouchpadOff=1
#synclient TapButton3=2
setxkbmap -option compose:ralt
setxkbmap -option caps:escape
eval `dbus-launch --sh-syntax`
export EDITOR=/usr/bin/vim
#xrandr --output VGA1 --auto --rotate left --primary --output HDMI1 --rotate left --auto --right-of VGA1 # zaphod
#xrandr --output DVI-0 --right-of HDMI-0 --mode 1366x768 --output HDMI-0 --primary --mode 1920x1080 # magrathea
#xrandr --output eDP1 --auto --primary # heimdall
#xrandr --output HDMI-0 --auto --primary --output DVI-I-1 --auto --left-of HDMI-0 # magrathea
#nvidia-settings --assign "CurrentMetaMode=DPY-3: nvidia-auto-select @1920x1080 +1600+0 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0}, DPY-2: nvidia-auto-select @1600x900 +0+180 {ViewPortIn=1600x900, ViewPortOut=1600x900+0+0}"
nvidia-settings --assign "CurrentMetaMode=DPY-2: 5120x1440_120 @5120x1440 +0+0 {AllowGSYNCCompatible=On, ViewPortIn=5120x1440, ViewPortOut=5120x1440+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources
#exec awesome
#exec openbox-session
#exec gnome-session
#exec cinnamon-session
exec i3

# vim: set ft=config :
