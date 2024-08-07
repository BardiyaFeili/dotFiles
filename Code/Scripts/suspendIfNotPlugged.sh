#!/bin/bash

POWER_STATUS=$(cat /sys/class/power_supply/ACAD/online)

if [ "$POWER_STATUS" -eq 0 ]; then
  systemctl suspend
fi
