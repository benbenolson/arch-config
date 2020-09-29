#!/bin/bash

# Virtualbox guest additions
sudo pacman -Sy --needed virtualbox-guest-utils
sudo systemctl enable vboxservice.service
sudo systemctl start vboxservice.service

# Make the VirtualBox services start on startup
sudo pacman -Sy --needed dex
echo "exec dex /etc/xdg/autostart/vboxclient.desktop" >> ~/.config/i3/config

# Fix resolution, change to some other resolution if you want
xrandr --output Virtual-1 --mode 1920x1200
echo "exec xrandr --output Virtual-1 --mode 1920x1200" >> ~/.config/i3/config
