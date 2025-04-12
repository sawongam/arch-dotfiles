#!/bin/bash

# List of packages to be installed via pacman and yay
pacman_packages=(
  alsa-utils android-sdk-build-tools android-sdk-platform-tools android-tools aspnet-runtime-7.0
  base base-devel bluez bluez-utils brightnessctl docker efibootmgr git gst-plugin-pipewire
  intel-ucode jdk17-openjdk libpulse libvirt linux linux-firmware nano neofetch networkmanager
  nodejs noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ntfs-3g numlockx nvidia
  nvidia-settings nvidia-utils openssh os-prober pacman-contrib pipewire pipewire-alsa
  pipewire-jack pipewire-pulse qemu-base reflector unzip zip zram-generator
)

yay_packages=(
  android-studio capitaine-cursors dotnet-sdk-7.0 github-cli greetd greetd-tuigreet grim grub
  hyprland hyprpaper kitty mako microsoft-edge-stable-bin npm otf-font-awesome ranger slurp
  swayidle swaylock-effects thunar thunar-archive-plugin ttf-dejavu ttf-font-awesome
  ttf-liberation ttf-nerd-fonts-symbols ttf-roboto tumbler virt-manager visual-studio-code-bin
  waybar wireplumber wl-gammarelay wofi xarchiver xclip xdg-desktop-portal-hyprland yay
)

# Install pacman packages
echo "Installing pacman packages..."
for pkg in "${pacman_packages[@]}"; do
  if ! pacman -Qi "$pkg" &>/dev/null; then
    sudo pacman -S --noconfirm "$pkg"
  else
    echo "$pkg is already installed."
  fi
done

# Install yay packages
echo "Installing yay packages..."
for pkg in "${yay_packages[@]}"; do
  if ! yay -Qi "$pkg" &>/dev/null; then
    yay -S --noconfirm "$pkg"
  else
    echo "$pkg is already installed."
  fi
done

echo "Installation complete!"
