#!/bin/bash

WALL_PATH='/home/bardiya/Pictures/Wallpapers/city.png'

echo -e "preload = $WALL_PATH \nwallpaper = eDP-1, $WALL_PATH" >'/home/bardiya/dotfiles/.config/hypr/hyprpaper.conf'

echo -e "\$color1 = 749AEB \n\$color2 = 435586 \n\$wp = $WALL_PATH" >'/home/bardiya/.cache/wal/hyprcolors.conf'

killall hyprpaper
hyprpaper

echo -e "@define-color foreground #7AA2F7; \n@define-color background rgba(10,15,18,0.6); \n@define-color cursor #9ccbd4;" >'/home/bardiya/.cache/wal/colors-waybar.css'

killall waybar
waybar
