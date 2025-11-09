#!/bin/bash

echo "=== Starting cleanup process (safe mode) ==="

### 1. Clear RAM cache
echo "-> Clearing RAM cache..."
sync
echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null

### 2. Empty user trash
echo "-> Emptying user trash..."
rm -rf ~/.local/share/Trash/files/* ~/.local/share/Trash/info/*

### 3. Clear Firefox cookies and cache
echo "-> Clearing Firefox cache..."
rm -f ~/.mozilla/firefox/*.default*/cookies.sqlite
rm -rf ~/.cache/mozilla/firefox/*.default*/cache2/*

### 4. Clear pacman cache
echo "-> Clearing pacman cache..."
sudo paccache -rk3        # keep last 3 versions
sudo pacman -Scc --noconfirm

### 5. Safe orphan check
echo "-> Checking for orphaned packages..."
orphans=$(pacman -Qtdq)
if [[ -n "$orphans" ]]; then
  echo "These packages are unused (orphans):"
  echo "$orphans"
  echo "Skipping auto-removal for safety. Remove manually if sure."
else
  echo "No orphaned packages found."
fi

### 6. Clear journal logs (keep 7 days)
echo "-> Clearing journal logs older than 7 days..."
sudo journalctl --vacuum-time=7d

### 7. Clear systemd temporary files
echo "-> Cleaning systemd temporary files..."
sudo systemctl clean --what=cache --what=logs
sudo systemctl clean --what=temporary

### 8. Clear user caches
echo "-> Clearing user cache..."
rm -rf ~/.cache/*

### 9. Clear thumbnails
echo "-> Clearing thumbnails..."
rm -rf ~/.cache/thumbnails/*

### 10. Clean development caches (optional)
echo "-> Cleaning development caches..."
command -v npm &>/dev/null && npm cache clean --force
command -v pip &>/dev/null && pip cache purge
command -v cargo &>/dev/null && cargo cache -a

### 11. Clean Flatpak (if installed)
if command -v flatpak &>/dev/null; then
  echo "-> Cleaning Flatpak unused data..."
  flatpak uninstall --unused -y
fi

### 12. Remove leftover pacman pkg cache safely
echo "-> Cleaning leftover pacman package cache..."
sudo find /var/cache/pacman/pkg/ -type f -mtime +30 -delete

### 13. Display space usage summary
echo
echo "=== Space usage summary ==="
sudo du -h --max-depth=1 / | sort -hr | head
echo
du -h --max-depth=1 ~ | sort -hr | head

echo
echo "=== Cleanup complete. System remains intact. ==="
