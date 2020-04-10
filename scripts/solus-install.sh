#!/bin/bash



## upgrade system

echo "--------------------- upgrading initial system ---------------------"
sudo eopkg up -y
echo "--------------------- inital upgrade complete ---------------------"
clear


## remove packages i dont like

echo "--------------------- removing package ---------------------"
sudo eopkg rm hexchat libreoffice-common thunderbird -y
echo "--------------------- base packages removed ---------------------"
clear


## add packages i do like

echo "--------------------- installing packages ---------------------"
sudo eopkg it deluge discord flatpak git gtkhash lollypop mpd ncmpcpp neofetch neovim p7zip seahorse zsh -y
echo "--------------------- base packages installed ---------------------"
clear


## install flathub repo

echo "--------------------- installing flathub repo ---------------------"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client
echo "--------------------- flathub repo installed ---------------------"
clear


## install microsoft fonts

echo "--------------------- installing microsoft fonts ---------------------"
sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/desktop/font/mscorefonts/pspec.xml -y
sudo eopkg it mscorefonts*.eopkg -y;sudo rm mscorefonts*.eopkg -y
echo "--------------------- third party packages installed ---------------------"
clear


## final system upgrade and cleanup

echo "--------------------- upgrading system ---------------------"
sudo eopkg up -y
echo "--------------------- system upgraded ---------------------"
clear
echo "--------------------- cleaning up ---------------------"
sudo eopkg rmo -y
echo "--------------------- cleaned :) ---------------------"
clear
echo "--------------------- final upgrade complete and orphan packages removed ---------------------"
clear


echo "--------------------- done ---------------------" && exit 0
