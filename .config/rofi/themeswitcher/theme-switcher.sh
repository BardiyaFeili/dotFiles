#!/bin/bash
exec >/dev/null 2>&1

theme="$1"
flavor="$2"

# Set the theme for kitty
echo -e "include ./$theme$flavor.conf" >"$HOME/.config/kitty/themes/theme.conf"

# Set the colors for Hyprland borders
echo -e "source = ~/.config/hypr/hyprthemes/$theme.conf" >"$HOME/.config/hypr/hyprcolors.conf"

# Set the theme for Neovim
echo -e "return {
  'LazyVim/LazyVim',
  opts = {
    colorscheme = '$theme$flavor',
  },
}" >"$HOME/.config/nvim/lua/plugins/colorset.lua"

# Set the theme for Yazi
echo -e "
[flavor]
use = '$theme'" >"$HOME/.config/yazi/theme.toml"

# Set the theme for Rofi
echo -e "@import '~/.config/rofi/colors/$theme.rasi'" >"$HOME/.config/rofi/colors/theme.rasi"

# Set the theme for Waybar
echo -e "@import url('./themes/$theme$flavor.css');" >"$HOME/.config/waybar/colors.css"
killall waybar
waybar
