#!/bin/bash

ARTIST=$(ncmpcpp --current-song='{%a}' 2>/dev/null)
TRACK=$(ncmpcpp --current-song='{%t}' 2>/dev/null)
ALBUM=$(ncmpcpp --current-song='{%b}' 2>/dev/null)

notify-send --expire-time=5000 --category=music --app-name=ncmpcpp "$TRACK" "$ARTIST\n$ALBUM"
