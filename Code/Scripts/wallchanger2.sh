#!/bin/bash

while getopts "w:" arg; do
  case $arg in
  w) WALL=$OPTARG ;;
  esac
done

echo -e "preload = $WALL \nwallpaper = eDP-1, $WALL" >'/home/bardiya/dotfiles/.config/hypr/hyprpaper.conf'

echo -e "\$wp = $WALL" >'/home/bardiya/.config/hypr/hyprcolors.conf'

killall hyprpaper
hyprpaper

killall waybar
waybar
