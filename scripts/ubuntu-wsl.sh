#!/bin/bash



## inital upgrade

echo "--------------------- upgrading system ---------------------"
sudo apt -y update
sudo apt -y upgrade
echo "--------------------- system upgraded ---------------------"


## install packages i like

echo "--------------------- installing packages ---------------------"
sudo apt -y install curl git neofetch neovim ppa-purge wget zsh
echo "--------------------- packages installed ---------------------"


## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/zsh
echo "--------------------- done ---------------------"


## install dotfiles
 
echo "--------------------- installing dotfiles ---------------------"
curl -fsSL https://starship.rs/install.sh | bash
cp -r dotfiles/. ~/
echo "--------------------- done ---------------------"


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt -y autoremove
sudo apt -y clean
echo "--------------------- final system cleaned up ---------------------"



echo "--------------------- please reboot ---------------------" && exit 0
