#!/bin/bash

# Variables
DIR_PATH="$HOME/Pictures/Wallpapers/"
WALL=$(copyq clipboard)

# Convert both to absolute paths
REAL_FILE_PATH=$(realpath "$WALL")
REAL_DIR_PATH=$(realpath "$DIR_PATH")

# Check if the file is inside the directory
if [[ "$REAL_FILE_PATH" == "$REAL_DIR_PATH"* ]]; then
  WALL=$(copyq clipboard)
  echo -e "$WALL" >"$HOME/.config/hypr/scripts/wptext"
else
  WALL=$(<"$HOME/.config/hypr/scripts/wptext")
fi

echo -e "preload = $WALL \nwallpaper = eDP-1, $WALL" >"$HOME/.config/hypr/hyprpaper.conf"

echo -e "\$wp = $WALL" >"$HOME/.config/hypr/hyprcolors.conf"

killall hyprpaper
hyprpaper
