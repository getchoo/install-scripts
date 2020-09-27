#!/bin/bash



## inital upgrade

echo "--------------------- upgrading system ---------------------"
sudo apt -y update
sudo apt -y upgrade
echo "--------------------- system upgraded ---------------------"
clear


## install packages i like

echo "--------------------- installing packages ---------------------"
sudo apt -y install curl git neofetch neovim ppa-purge wget zsh
echo "--------------------- packages installed ---------------------"
clear


## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/zsh
echo "--------------------- done ---------------------"
clear


## install dotfiles
 
echo "--------------------- installing dotfiles ---------------------"
cp -r dotfiles/. ~/
rm -rf ~/.config/solus ~/.config/autostart
echo "source ~/.zprofile" | tee -a ~/.profile
echo "--------------------- done ---------------------"
clear


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt -y autoremove
sudo apt -y clean
echo "--------------------- final system cleaned up ---------------------"
clear



echo "--------------------- please reboot ---------------------" && exit 0
