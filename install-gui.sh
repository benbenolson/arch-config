#!/bin/bash

sudo pacman -Sy --needed xorg-server \
	lightdm \
	lightdm-gtk-greeter \
	i3 \
	i3status \
	compton \
	kitty \
	feh \
	dmenu \
	pasystray \
	pavucontrol \
	pulseaudio \
	chromium

# Configure LightDM
sudo systemctl enable lightdm.service
sudo cp etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf

# Configure i3
mkdir -p ~/.config/i3
cp .config/i3/config ~/.config/i3

# Configure kitty
mkdir -p ~/.config/kitty
cp .config/kitty/kitty.conf ~/.config/kitty/kitty.conf

cp .vimrc ~
