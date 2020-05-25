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
sudo apt -y install curl flatpak git neofetch neovim p7zip-full ppa-purge ttf-mscorefonts-installer zsh
echo "--------------------- packages installed ---------------------"
clear


## add dotfiles

echo "--------------------- add dotfiles ---------------------"
git clone https://github.com/sethfl/install-scripts.git
cp -r install-scripts/dotfiles/zsh ~/.config
cp install-scripts/dotfiles/.profile ~/.
rm -rf install-scripts
echo "--------------------- done ---------------------"
clear


## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/zsh
echo "--------------------- done ---------------------"
clear


## final system upgrade

echo "--------------------- upgrade ---------------------"
sudo apt -y update
sudo apt -y upgrade
echo "--------------------- final system update complete ---------------------"
clear


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt -y autoremove
sudo apt -y clean
echo "--------------------- final system cleaned up ---------------------"
clear



echo "--------------------- please reboot ---------------------" && exit 0
