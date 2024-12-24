#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/.wallpapers"

# Randomly select a wallpaper
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

# Update Hyprpaper config
echo "preload = $RANDOM_WALLPAPER" > "$HOME/.config/hypr/hyprpaper.conf"
echo "wallpaper = eDP-1, contain:$RANDOM_WALLPAPER" >> "$HOME/.config/hypr/hyprpaper.conf"
echo "ipc = off" >> "$HOME/.config/hypr/hyprpaper.conf"

# Kill any running instance of Hyprpaper
pkill -f hyprpaper

# Start Hyprpaper with the new configuration
hyprpaper
