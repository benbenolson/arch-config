#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy source code
mkdir -p ${HOME}/src
cp -r src/* ${HOME}/src/

# Install yed
cd ${HOME}/src/yed
./clean.sh && ./build.sh && sudo ./install.sh
mkdir -p ${HOME}/.yed
cp ${BASEDIR}/.yed/init.c ${HOME}/.yed/
cd ${HOME}/.yed
gcc -shared -fPIC -g -O3 init.c -lyed -o init.so

# I3 WINDOW MANAGER
mkdir -p $HOME/.config/i3/
cp ${BASEDIR}/.config/i3/config $HOME/.config/i3/config

# FONTCONFIG
mkdir -p $HOME/.config/fontconfig
cp ${BASEDIR}/.config/fontconfig/fonts.conf ${HOME}/.config/fontconfig/fonts.conf

# FONTS
mkdir -p ${HOME}/.local/share/
cp -r ${BASEDIR}/.local/share/fonts ${HOME}/.local/share/
fc-cache -fv

# Install GUI software
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

# Install st terminal emulator
cd ${HOME}/src/suckless/st
make
sudo make install

if [ "${1}" == "vm" ]; then
	# Virtualbox guest additions
	sudo pacman -Sy --needed virtualbox-guest-utils
	sudo systemctl enable vboxservice.service
	sudo systemctl start vboxservice.service

	# Make the VirtualBox services start on startup
	sudo pacman -Sy --needed dex
	echo "exec dex /etc/xdg/autostart/vboxclient.desktop" >> ~/.config/i3/config

	# Fix resolution, change to some other resolution if you want
	# You might have to go into the Virtualbox GUI client on the host and change the resolution for this to work.
	xrandr --output Virtual-1 --mode 1920x1200
	echo "exec xrandr --output Virtual-1 --mode 1920x1200" >> ~/.config/i3/config
fi
