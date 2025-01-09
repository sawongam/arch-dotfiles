#!/bin/bash

WALLPAPER_DIR="$HOME/.wallpapers"

CURRENT_WALLPAPER=$(grep "wallpaper = HDMI-A-1" "$HOME/.config/hypr/hyprpaper.conf" | cut -d',' -f2 | sed 's/contain://')

CURRENT_WALLPAPER=$(echo "$CURRENT_WALLPAPER" | xargs)

if [ -f "$CURRENT_WALLPAPER" ]; then
    rm "$CURRENT_WALLPAPER"
    echo "Deleted secondary wallpaper: $CURRENT_WALLPAPER"
else
    echo "No secondary wallpaper found to delete: $CURRENT_WALLPAPER"
fi

exec ~/.config/hypr/scripts/random_wallpaper.sh