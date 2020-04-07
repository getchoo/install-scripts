#!/bin/bash



## append dnf.conf

sudo bash -c 'echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf'
sudo bash -c 'echo "fastestmirror=True" >> /etc/dnf/dnf.conf'
clear


## upgrade system

echo "--------------------- upgrading system ---------------------"
sudo dnf upgrade -y
echo "--------------------- initial system upgrade complete ---------------------"
clear


## add rpm repos

echo "--------------------- installing extra repos ---------------------"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core
echo "--------------------- extra repos installed ---------------------"
clear


## add flathub

echo "--------------------- adding flathub repo ---------------------"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "--------------------- flathub repo installed ---------------------"
clear


## install packages

echo "--------------------- installing packages ---------------------"
sudo dnf remove libreoffice-x11
sudo dnf install htop neovim p7zip zsh -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client
flatpak install flathub com.discordapp.Discord
echo "--------------------- apps installed ---------------------"
clear


## install fedy

echo "--------------------- installing fedy ---------------------"
sudo dnf copr enable kwizart/fedy
sudo dnf install fedy -y
echo "--------------------- fedy installed ---------------------"
clear


## upgrade system again

echo "--------------------- updating ---------------------"
sudo dnf update -y
echo "--------------------- system upgraded ---------------------"
clear


#remove orphans

echo "--------------------- removing orphans ---------------------"
sudo dnf autoremove -y
echo "--------------------- orphan packages deleted ---------------------"
clear


echo "--------------------- please reboot ---------------------" && exit 0
