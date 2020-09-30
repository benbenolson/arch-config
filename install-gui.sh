#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

cd ${BASEDIR}/src/suckless/st
make
sudo make install
