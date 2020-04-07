#!/bin/bash



## remove libreoffice

echo "--------------------- removing libreoffice ---------------------"
sudo apt remove libreoffice*
echo "--------------------- done ---------------------"
clear


## inital upgrade

echo "--------------------- upgrading system ---------------------"
sudo apt update -y
sudo apt upgrade -y
echo "--------------------- system upgraded ---------------------"
clear


## remove orphans

echo "--------------------- removing orphans ---------------------"
sudo apt autoremove -y
echo "--------------------- orphans removed ---------------------"
clear


## install packages i like

echo "--------------------- installing packages ---------------------"
sudo apt install neofetch git neovim zsh wget ttf-mscorefonts-installer p7zip-full -y
echo "--------------------- packages installed ---------------------"
clear

## install flatpak apps

echo "--------------------- installing flatpak apps ---------------------"
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install com.spotify.Client com.discordapp.Discord
echo "--------------------- installed flatpak apps ---------------------"
clear


## final system upgrade

echo "--------------------- upgrade ---------------------"
sudo apt update -y
sudo apt full-upgrade -y
echo "--------------------- final system update complete ---------------------"
clear


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt autoremove -y
sudo apt clean -y
echo "--------------------- final system cleaned up ---------------------"
clear



echo "--------------------- please reboot ---------------------" && exit 0
