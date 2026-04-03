#!/bin/bash

if [[ "$1" == *"overview.png"* ]]; then
  exit
elif [[ "$1" == $(<"/home/harunato/Pictures/Wallpapers/Temp/clear_wallpaper.txt") ]]; then
  exit
else
  OVERVIEW_FILE="/home/harunato/Pictures/Wallpapers/Temp/overview.png"
  CUR_IMAGE=$(qs -c noctalia-shell ipc call wallpaper get all)
  echo $CUR_IMAGE >"/home/harunato/Pictures/Wallpapers/Temp/clear_wallpaper.txt"
  magick $CUR_IMAGE -resize 60% -blur 0x08 $OVERVIEW_FILE
fi
