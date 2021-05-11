#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# This is just here because I always forget to download submodules
git submodule update --init --recursive

#pacman -Syu
#pacman -Sy sudo openssh vim base-devel
#pacman -Sy gcc fontconfig vi

#useradd -m macslayer
#usermod -G wheel -a macslayer
#passwd macslayer
#visudo

chmod o+x /root
chmod o+x ${BASEDIR}
chmod o+x ${BASEDIR}/install-user.sh
sudo -u macslayer -H sh -c "${BASEDIR}/install-user.sh $@" 
