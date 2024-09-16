#!/bin/bash

# List of themes
themes=(
  "tokyonight-night"
  "tokyonight-moon"
  "tokyonight-storm"
  "catppuccin-mocha"
  "gruvbox"
  "onedark"
)

# Show Rofi menu to select a theme
theme=$(printf "%s\n" "${themes[@]}" | rofi -dmenu -p "Select Theme" -theme ~/.config/rofi/themeswitcher/style.rasi)

# Check if a theme was selected
if [ -n "$theme" ]; then
  # Check if the theme contains a hyphen
  if [[ "$theme" == *-* ]]; then
    # Split theme by hyphen
    IFS='-' read -r part1 part2 <<<"$theme"
    # Run the theme-switcher script with two parts as arguments
    ~/.config/rofi/themeswitcher/theme-switcher.sh "$part1" "-$part2"
  else
    # Run the theme-switcher script with the theme as a single argument
    ~/.config/rofi/themeswitcher/theme-switcher.sh "$theme"
  fi
fi
