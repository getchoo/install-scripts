#!/bin/bash



## append dnf.conf

echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf
clear


## upgrade system

echo "--------------------- upgrading system ---------------------"
sudo dnf -y upgrade
echo "--------------------- initial system upgrade complete ---------------------"
clear


## add rpm repos

echo "--------------------- installing extra repos ---------------------"
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y groupupdate core
dnf copr enable pschyska/alacritty
echo "--------------------- extra repos installed ---------------------"
clear


## install packages

echo "--------------------- installing packages ---------------------"
sudo dnf -y remove libreoffice-x11
sudo dnf -y install alacritty curl fedy fish htop lpf-mscore-fonts neovim p7zip
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak -y install flathub com.axosoft.GitKraken com.discordapp.Discord
echo "--------------------- apps installed ---------------------"
clear


## add dotfiles

echo "--------------------- add dotfiles ---------------------"
mkdir ~/.config/alacritty
curl https://raw.githubusercontent.com/sethfl/install-scripts/master/dotfiles/alacritty.yml | tee ~/.config/alacritty/alacritty.yml
echo "--------------------- done ---------------------"
clear


## upgrade system again

echo "--------------------- updating ---------------------"
sudo dnf -y update
echo "--------------------- system upgraded ---------------------"
clear


#remove orphans

echo "--------------------- removing orphans ---------------------"
sudo dnf -y autoremove
echo "--------------------- orphan packages deleted ---------------------"
clear


echo "--------------------- please reboot ---------------------" && exit 0
