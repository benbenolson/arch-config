systemctl enable dhcpcd
systemctl start dhcpcd
pacman -Syu
pacman -S sudo openssh git vim base-devel
visudo
useradd -m macslayer
usermod -G wheel -a macslayer
passwd macslayer
