#!/bin/bash

sudo systemctl start bluetooth
sleep 1
echo -e 'power on\nconnect 87:5E:6C:DE:8E:B2\nquit' | bluetoothctl
