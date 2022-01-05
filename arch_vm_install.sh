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
  exit
fi

# Test efi
if ls /sys/firmware/efi/efivars > /dev/null
then
  echo "[+] You have EFI support"
else
  echo "[!] You do not have EFI support. Exiting..."
  exit
fi

# Set clock
timedatectl set-ntp true

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
mkdir -p /mnt/boot
mount "${INSTALL_DISK}1" /mnt/boot

# Base install + config
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

# Now chroot into that bad boy and do STUFF

# Locale will be managed via Ansible, but set temporarily
arch-chroot /mnt ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
arch-chroot /mnt hwclock --systohc
arch-chroot /mnt locale-gen
arch-chroot /mnt echo "LANG=en_GB.UTF-8" > /etc/locale.conf
arch-chroot /mnt echo "arch" > /etc/hostname

# Now enable the system to boot
arch-chroot /mnt mkinitcpio -P

# The only tools we really need to boot and run ansible
arch-chroot /mnt pacman -S sudo git vim python sshd efibootmgr glibc grub amd-ucode intel-ucode dhclient iputils inetutils dhcpd  --noconfirm

# Install grub - EFI mode
arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

echo "[+] Install complete, but..."
echo "[!] YOU NEED TO CHANGE THE ROOT PASSWORD NOW."

arch-chroot /mnt passwd
