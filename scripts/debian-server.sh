#!/bin/sh

# # #
# g3tchoo's debian server install script
# # #


## update all git submodules

echo "--------------------- fetching submodules ---------------------"
git submodule update --init --recursive --remote
echo "--------------------- submodules fetched ---------------------"


## inital upgrade

echo "--------------------- upgrading system ---------------------"
sudo apt -y update
sudo apt -y upgrade
echo "--------------------- system upgraded ---------------------"


## install packages i like

echo "--------------------- installing packages ---------------------"
sudo apt -y install curl git software-properties-common zsh
echo "--------------------- packages installed ---------------------"


## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/zsh
echo "--------------------- done ---------------------"


## install dotfiles

echo "--------------------- installing dotfiles ---------------------"
cp -r dotfiles/. ~
$HOME/.local/bin/clean-home
echo "--------------------- done ---------------------"


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt -y autoremove
sudo apt -y clean
echo "--------------------- final system cleaned up ---------------------"



echo "--------------------- please reboot ---------------------" && exit 0
