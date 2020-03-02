#!/bin/bash



## inital upgrade
echo "--------------------- upgrading system ---------------------"
sudo apt update -y
sudo apt upgrade -y
clear
echo "--------------------- system upgraded ---------------------"


## remove orphans

echo "--------------------- removing orphans ---------------------"
sudo apt autoremove -y
clear
echo "--------------------- orphans removed ---------------------"


## install packages i like

echo "--------------------- installing packages ---------------------"
sudo apt install neofetch git vim zsh -y
clear
echo "--------------------- packages installed ---------------------"


## install flatpak apps

echo "--------------------- installing flatpak apps ---------------------"
sudo apt install flatpak gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install com.dropbox.Client -y
flatpak install com.spotify.Client -y
flatpak install com.discordapp.Discord -y
clear
echo "--------------------- flatpak apps installed ---------------------"


## set new shell for user

echo "--------------------- setting new shell for user ---------------------"
chsh -s /bin/zsh
clear
echo "--------------------- done ---------------------" 


## customize zsh

echo "--------------------- adding papa luke's zsh config ---------------------"	
wget -O ~/.zshrc https://gist.githubusercontent.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52/raw/2a93cca1ea82cecfc2bd6dcd2eff700a95c7581e/zshrc
clear
echo "--------------------- done ---------------------"


## final system upgrade

echo "--------------------- upgrade ---------------------"
sudo apt update -y
sudo apt full-upgrade -y
clear
echo "--------------------- final system update complete ---------------------"


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt autoremove -y
sudo apt clean -y
sudo apt update -y
clear
echo "--------------------- final system cleaned up ---------------------"


echo "--------------------- done ---------------------"



echo "--------------------- please reboot ---------------------" && exit 0
