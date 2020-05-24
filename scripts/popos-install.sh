#!/bin/bash



## remove libreoffice

echo "--------------------- removing libreoffice ---------------------"
sudo apt -y remove libreoffice*
echo "--------------------- done ---------------------"
clear


## add pcr

echo "--------------------- adding pcr ---------------------"
sudo apt -y install wget
wget -qO - https://apt.pop-planet.info/key.asc | sudo apt-key add -
sudo apt-add-repository https://apt.pop-planet.info
echo "--------------------- done ---------------------"
clear


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
sudo apt -y install alacritty curl fish flatpak git neofetch neovim p7zip-full ppa-purge ttf-mscorefonts-installer
echo "--------------------- packages installed ---------------------"
clear


## add dotfiles

echo "--------------------- add dotfiles ---------------------"
mkdir ~/.config/alacritty
curl https://raw.githubusercontent.com/sethfl/install-scripts/master/dotfiles/alacritty.yml | tee ~/.config/alacritty/alacritty.yml
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
