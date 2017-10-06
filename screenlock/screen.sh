#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
[[ -f $1 ]] && convert /tmp/screen.png "$1" -geometry +350+500 -composite -matte /tmp/screen.png
i3lock -u -i /tmp/screen.png

function finish {
        kill i3lock
        rm /tmp/screen.png
}
trap finish EXIT
