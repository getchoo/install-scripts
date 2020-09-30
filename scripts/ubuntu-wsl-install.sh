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
echo "@reboot /home/seth/.config/zsh/profile.sh" | sudo tee /var/spool/cron/seth
echo "--------------------- done ---------------------"
clear


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt -y autoremove
sudo apt -y clean
echo "--------------------- final system cleaned up ---------------------"
clear



echo "--------------------- please reboot ---------------------" && exit 0
