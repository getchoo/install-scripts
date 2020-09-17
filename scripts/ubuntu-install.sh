#!/bin/bash



## inital upgrade

echo "--------------------- upgrading system ---------------------"
sudo apt -y update
sudo apt -y upgrade
echo "--------------------- system upgraded ---------------------"
clear


## remove orphans

echo "--------------------- removing orphans ---------------------"
sudo apt -y autoremove
echo "--------------------- orphans removed ---------------------"
clear


## install packages i like

echo "--------------------- installing packages ---------------------"
sudo apt -y install curl git neofetch neovim p7zip-full ppa-purge ttf-mscorefonts-installer zsh
echo "--------------------- packages installed ---------------------"
clear


## replace snap with flatpak

echo "--------------------- installing flatpak apps ---------------------"
sudo apt -y purge snapd
sudo apt -y install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.discordapp.Discord
echo "--------------------- flatpak apps installed ---------------------"
clear


## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/zsh
echo "--------------------- done ---------------------"
clear


## install dotfiles

echo "--------------------- installing dotfiles ---------------------"
mkdir -p ~/dev/git && cd ~/dev/git
git clone https://github.com/sethfl/install-scripts.git
cp -r install-scripts/dotfiles/* ~/.
echo "--------------------- done ---------------------"
clear

## final system upgrade

echo "--------------------- upgrade ---------------------"
sudo apt -y update
sudo apt -y full-upgrade
echo "--------------------- final system update complete ---------------------"
clear


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt -y autoremove
sudo apt -y clean
echo "--------------------- final system cleaned up ---------------------"
clear



echo "--------------------- please reboot ---------------------" && exit 0
