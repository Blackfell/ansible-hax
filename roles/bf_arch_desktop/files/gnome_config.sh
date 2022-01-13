#!/bin/bash

RUN_ALREADY=$(cat ~/.config/GNOME_CONFIG_RUN_ONCE)

if [ $RUN_ALREADY = "0" ]
then
  gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Grey"
  gsettings set org.gnome.desktop.wm.preferences theme "Orchis-grey"
  gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/BFBackground.png"
  gsettings set org.gnome.desktop.interface icon-theme "Tela-circle"
  gsettings set org.gnome.shell.extensions.user-theme name "Orchis-grey"
  gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
  echo "[+] Configuration complete. Declaring completion."
  echo 1 > ~/.config/GNOME_CONFIG_RUN_ONCE
else
  echo "[+] Config run once, doing nothing."
fi
