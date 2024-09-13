#!/bin/bash

WALL=$(copyq clipboard)

echo -e "preload = $WALL \nwallpaper = eDP-1, $WALL" >"$HOME/.config/hypr/hyprpaper.conf"

echo -e "\$wp = $WALL" >"$HOME/.config/hypr/hyprwp.conf"

killall hyprpaper
hyprpaper
