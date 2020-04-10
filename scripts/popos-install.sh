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
sudo apt -y install flatpak git mpd ncmpcpp neofetch neovim p7zip-full ppa-purge ttf-mscorefonts-installer zsh
echo "--------------------- packages installed ---------------------"
clear

## install flatpak apps

echo "--------------------- installing flatpak apps ---------------------"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak -y install flathub com.discordapp.Discord com.spotify.Client
echo "--------------------- installed flatpak apps ---------------------"
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
