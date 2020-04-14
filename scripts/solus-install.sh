#!/bin/bash



## upgrade system

echo "--------------------- upgrading initial system ---------------------"
sudo eopkg -y up
echo "--------------------- inital upgrade complete ---------------------"
clear


## remove packages i dont like

echo "--------------------- removing package ---------------------"
sudo eopkg -y rm hexchat libreoffice-common rhythmbox thunderbird
echo "--------------------- base packages removed ---------------------"
clear


## add packages i do like

echo "--------------------- installing packages ---------------------"
sudo eopkg -y it deluge discord fish flatpak git lollypop neofetch neovim p7zip
echo "--------------------- base packages installed ---------------------"
clear


## install flathub repo

echo "--------------------- installing flathub repo ---------------------"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.axosoft.GitKraken
echo "--------------------- flathub repo installed ---------------------"
clear


## install microsoft fonts

echo "--------------------- installing microsoft fonts ---------------------"
sudo eopkg -y bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/desktop/font/mscorefonts/pspec.xml
sudo eopkg -y it mscorefonts*.eopkg;sudo rm mscorefonts*.eopkg
echo "--------------------- third party packages installed ---------------------"
clear


## final system upgrade and cleanup

echo "--------------------- upgrading system ---------------------"
sudo eopkg -y up
echo "--------------------- system upgraded ---------------------"
clear
echo "--------------------- cleaning up ---------------------"
sudo eopkg -y rmo
echo "--------------------- cleaned :) ---------------------"
clear
echo "--------------------- final upgrade complete and orphan packages removed ---------------------"
clear


echo "--------------------- done ---------------------" && exit 0
