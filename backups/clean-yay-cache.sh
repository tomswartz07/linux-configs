#!/bin/bash
cachedirs="$(find ~/.cache/yay -maxdepth 1 -type d | awk '{ print "-c " $1 }' | tail -n +2)"
echo "==> clean AUR package cache"
/usr/bin/paccache -rvk3 $cachedirs
