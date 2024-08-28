#!/bin/bash

# Check the current state of Wi-Fi
wifi_status=$(nmcli radio wifi)

if [ "$wifi_status" == "enabled" ]; then
  # If Wi-Fi is enabled, turn it off
  nmcli radio wifi off
  echo "Wi-Fi has been turned off."
  
else
  # If Wi-Fi is disabled, turn it on
  nmcli radio wifi on
  echo "Wi-Fi has been turned on."
fi
