#!/bin/bash
# Change wallpaper every X minutes
# INTERVAL=$((30 * 60))
INTERVAL=600
# Pull a random image from here
DIR=~/Pictures/wpp

COUNTER=0
trap change_wallpaper USR1

change_wallpaper() {
  NEWPAPER=$(find "$DIR" -type f \( -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' \) | shuf -n1)
  feh --bg-fill "$NEWPAPER"
  COUNTER=0
}

change_wallpaper
while true; do
  if [[ $COUNTER -ge $INTERVAL ]]; then
    change_wallpaper
  fi
  sleep 1
  COUNTER=$(( $COUNTER + 1 ))
done