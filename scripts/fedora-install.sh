#!/bin/bash

sudo dnf update -y
echo "initial system upgrade complete"

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y 
sudo dnf install rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data -y
echo "rpmfusion repos installed"

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
flatpak update
echo "flathub repo installed"

killall gnome-software
rm -rf ~/.cache/gnome-software
echo "gnome software reloaded"

sudo dnf install neofetch gnome-tweaks -y
flatpak update
flatpak install flathub com.spotify.client
flatpak install flathub com.discordapp.Discord
echo "apps installed"

sudo dnf copr enable kwizart/fedy
sudo dnf install fedy -y
echo "fedy installed"

sudo dnf install plymouth-theme-charge -y
sudo plymouth-set-default-theme charge -R
echo "plymouth themed changed to charge. initrd rebuilt."

sudo dnf update -y
sudo dnf upgrade -y
echo "system upgraded"

sudo dnf autoremove -y
echo "orphan packages deleted"

echo "please reboot" && exit 0
