#!/bin/sh

# Set up custom icons
icon_night="weather-clear-night-symbolic"
icon_day="weather-clear-symbolic"
if [ "$1" = period-changed ]; then
        case $3 in
                night)
                        exec notify-send "Redshift" "Period changed to $3" --icon="${icon_night}"
                        ;;
                transition)
                        exec notify-send "Redshift" "Period changed to $3"
                        ;;
                daytime)
                        exec notify-send "Redshift" "Period changed to $3" --icon="${icon_day}"
                        ;;
        esac
fi
