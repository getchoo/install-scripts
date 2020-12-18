#!/bin/bash



## inital upgrade

echo "--------------------- upgrading system ---------------------"
sudo apt -y update
sudo apt -y upgrade
echo "--------------------- system upgraded ---------------------"
clear


## install packages i like

echo "--------------------- installing packages ---------------------"
sudo apt -y install curl git neofetch neovim p7zip-full ppa-purge ttf-mscorefonts-installer ubuntu-restricted-extras wget zsh
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
curl -fsSL https://starship.rs/install.sh | bash
cp -r dotfiles/. ~/
echo "--------------------- done ---------------------"
clear


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt -y autoremove
sudo apt -y clean
echo "--------------------- final system cleaned up ---------------------"
clear



echo "--------------------- please reboot ---------------------" && exit 0
