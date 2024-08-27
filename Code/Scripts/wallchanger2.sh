#!/bin/bash

while getopts "w:" arg; do
  case $arg in
  w) WALL=$OPTARG ;;
  esac
done

echo -e "preload = $WALL \nwallpaper = eDP-1, $WALL" >'/home/bardiya/dotfiles/.config/hypr/hyprpaper.conf'

killall hyprpaper
hyprpaper

killall waybar
waybar

#pywalfox update
