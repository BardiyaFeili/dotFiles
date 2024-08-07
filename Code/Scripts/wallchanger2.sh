#!/bin/bash

while getopts "w:" arg; do
  case $arg in
  w) WALL=$OPTARG ;;
  esac
done

wal -i ~/Pictures/Wallpapers/$WALL -n

WALL_PATH=$(<'/home/bardiya/.cache/wal/wal')

echo -e "preload = $WALL_PATH \nwallpaper = eDP-1, $WALL_PATH" >'/home/bardiya/dotfiles/.config/hypr/hyprpaper.conf'

killall hyprpaper
hyprpaper

killall waybar
waybar

pywalfox update

python3 ~/Code/Scripts/colorpicker.py
