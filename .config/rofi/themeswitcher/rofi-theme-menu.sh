#!/bin/bash

# List of themes
themes=(
  "tokyonight-night"
  "catppuccin-mocha"
  "gruvbox"
)

# Show Rofi menu to select a theme
theme=$(printf "%s\n" "${themes[@]}" | rofi -dmenu -p "Select Theme" -theme ~/.config/rofi/themeswitcher/style.rasi)

# Check if a theme was selected
if [ -n "$theme" ]; then
  # Run the theme-switcher script with the selected theme
  ~/.config/rofi/themeswitcher/theme-switcher.sh "$theme"
fi
