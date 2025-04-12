#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/.wallpapers"

# Directory to store the current wallpapers
CURRENT_WALLPAPER_DIR="$HOME/.wallpapers/current"

# Randomly select a wallpaper for each display
RANDOM_WALLPAPER_PRIMARY=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)
RANDOM_WALLPAPER_SECONDARY=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

# Update Hyprpaper config
echo "preload = $RANDOM_WALLPAPER_PRIMARY" > "$HOME/.config/hypr/hyprpaper.conf"
echo "preload = $RANDOM_WALLPAPER_SECONDARY" >> "$HOME/.config/hypr/hyprpaper.conf"
echo "wallpaper = eDP-1, contain:$RANDOM_WALLPAPER_PRIMARY" >> "$HOME/.config/hypr/hyprpaper.conf"
echo "wallpaper = HDMI-A-1, contain:$RANDOM_WALLPAPER_SECONDARY" >> "$HOME/.config/hypr/hyprpaper.conf"
echo "ipc = off" >> "$HOME/.config/hypr/hyprpaper.conf"

# Kill any running instance of Hyprpaper
pkill -f hyprpaper

# Start Hyprpaper with the new configuration
hyprpaper

# Copy the selected wallpapers to the current wallpaper directory with correct extensions [For IDEs]
cp "$RANDOM_WALLPAPER_PRIMARY" "$CURRENT_WALLPAPER_DIR/wallpaper_1.jpg"
cp "$RANDOM_WALLPAPER_SECONDARY" "$CURRENT_WALLPAPER_DIR/wallpaper_2.jpg"
