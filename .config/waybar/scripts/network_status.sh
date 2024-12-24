#!/bin/bash

status=$(nmcli -t -f WIFI g)
if [ "$status" = "enabled" ]; then
  connection=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)
  if [ -n "$connection" ]; then
    echo ""
  else
    echo "󰤫"
  fi
else
  echo "󰤮"
fi