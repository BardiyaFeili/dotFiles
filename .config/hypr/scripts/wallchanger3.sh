#!/bin/bash

# Variables
DIR_PATH="/home/bardiya/Pictures/Wallpapers/"
WALL=$(copyq clipboard)

# Convert both to absolute paths
REAL_FILE_PATH=$(realpath "$WALL")
REAL_DIR_PATH=$(realpath "$DIR_PATH")

# Check if the file is inside the directory
if [[ "$REAL_FILE_PATH" == "$REAL_DIR_PATH"* ]]; then
  WALL=$(copyq clipboard)
  echo -e "$WALL" >"./wptext"
else
  WALL=$(<"./wptext")
fi

echo -e "preload = $WALL \nwallpaper = eDP-1, $WALL" >'/home/bardiya/dotfiles/.config/hypr/hyprpaper.conf'

echo -e "\$wp = $WALL" >'/home/bardiya/.config/hypr/hyprcolors.conf'

killall hyprpaper
hyprpaper
