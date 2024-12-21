#!/bin/bash

status=$(cat /sys/class/power_supply/BAT0/status)
capacity=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$status" = "Discharging" ]; then
  if [ "$capacity" -ge 80 ]; then
    color="#46F197"  # Green
  elif [ "$capacity" -ge 20 ]; then
    color="#F1AF46"  # Orange
  else
    color="#F1465A"  # Red
  fi
  echo "<span color=\"$color\"> $capacity%</span>"
fi