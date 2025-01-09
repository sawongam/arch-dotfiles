#!/bin/bash

pacman -Syu

echo "Setting up partitions..."

# Format partitions
mkswap /dev/nvme0n1p6   # Swap partition
mkfs.ext4 /dev/nvme0n1p7  # Root partition

# Mount partitions
mount /dev/nvme0n1p2 /mnt
mount /dev/nvme0n1p4 /mnt

# Install base packages
pacstrap /mnt base linux linux-firmware

# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into the new system
arch-chroot /mnt <<EOF
# Set timezone
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc

# Localization settings
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

# Network configuration
echo "myhostname" > /etc/hostname
cat <<EOL >> /etc/hosts
127.0.0.1    localhost
::1          localhost
127.0.1.1    myhostname.localdomain myhostname
EOL

# Install additional packages
pacman -S --noconfirm $(cat /path/to/package_list.txt)

# Set root password (prompt for input)
passwd

EOF

echo "Installation complete! Reboot into your new system."
