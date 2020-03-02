#!/bin/bash



## upgrade system

echo "--------------------- upgrading initial system ---------------------"
sudo eopkg up -y
clear
echo "--------------------- inital upgrade complete ---------------------"


## remove packages i dont like

echo "--------------------- removing package ---------------------"
sudo eopkg rm hexchat libreoffice-common thunderbird -y
clear 
echo "--------------------- base packages removed ---------------------"


## add packages i do like

echo "--------------------- installing packages ---------------------"
sudo eopkg it neofetch menulibre vim zsh discord flatpak -y
clear
echo "--------------------- base packages installed ---------------------"


## install flatpak apps

echo "--------------------- installing flatpak apps ---------------------"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install com.dropbox.Client -y
flatpak install com.spotify.Client -y
clear 
echo "--------------------- flatpak apps installed ---------------------"


## install microsoft fonts

echo " --------------------- installing microsoft fonts ---------------------"
sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/desktop/font/mscorefonts/pspec.xml -y
sudo eopkg it mscorefonts*.eopkg -y;sudo rm mscorefonts*.eopkg -y
clear
echo "--------------------- third party packages installed ---------------------"


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


## final system upgrade and cleanup

echo "--------------------- upgrading system ---------------------"
sudo eopkg ur -y
sudo eopkg up -y
echo "--------------------- system upgraded ---------------------"
echo "--------------------- cleaning up ---------------------"
sudo eopkg rmo -y
echo "--------------------- cleaned :) ---------------------"
clear
echo "--------------------- final upgrade complete and orphan packages removed ---------------------"



echo "--------------------- done ---------------------" && exit 0
