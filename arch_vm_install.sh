#!/usr/bin/env bash

# global variables
INSTALL_DISK="/dev/sda"

# Installer keymap
loadkeys uk

# Test internet
if ping -c 1 archlinux.org
then
  echo "[+] Internet accessible"
else
  echo "[!] Could not reach archlinux.org. Exiting..."
fi

# Partition the disk
parted $INSTALL_DISK mklabel GPT
parted $INSTALL_DISK mkpart fat32 0%free 1G   # 1G ish for boot
parted $INSTALL_DISK set 1 esp on             # Set boot flags
parted $INSTALL_DISK mkpart ext4 1G 100%free

# Filesystems
mkfs.ext4 "${INSTALL_DISK}2"
mkfs.fat -F 32 "${INSTALL_DISK}1"

# Mount the disks
mount "${INSTALL_DISK}2" /mnt
mkdir -p /mnt/efi
mount "${INSTALL_DISK}1" /mnt/efi

# Base install + config
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

# Now chroot into that bad boy and do STUFF

# Locale will be managed via Ansible
arch-chroot /mnt mkinitcpio -P

# The only tools we really need to run ansible
arch-chroot /mnt pacman -Sy sudo git vim python efibootmgr glibc grub --noconfirm

# Install grub - EFI mode
arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB

echo "[+] Install complete"
echo "[!] YOU NEED TO CHANGE THE ROOT PASSWORD"
arch-chroot /mnt passwd
