#!/bin/sh

# # #
# g3tchoo's solus install script
# # #
 
## update all git submodules 
 
echo "--------------------- fetching submodules ---------------------"
git submodule update --init --recursive --remote
echo "--------------------- submodules fetched ---------------------"
 

## upgrade system

echo "--------------------- upgrading initial system ---------------------"
sudo eopkg -y up
echo "--------------------- inital upgrade complete ---------------------"
clear


## remove packages i dont like

echo "--------------------- removing package ---------------------"
sudo eopkg -y rm hexchat libreoffice-common rhythmbox thunderbird
echo "--------------------- base packages removed ---------------------"


## add packages i do like

echo "--------------------- installing packages ---------------------"
sudo eopkg -y it curl discord git neofetch neovim p7zip wget zsh
echo "--------------------- base packages installed ---------------------"


## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/zsh
echo "--------------------- done ---------------------"


## install dotfiles

echo "--------------------- installing dotfiles ---------------------"
cp -r dotfiles/. ~
$HOME/.local/bin/clean-home
echo "--------------------- done ---------------------"


## install fonts

echo "--------------------- installing fonts ---------------------"
sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P /usr/share/fonts/truetype/
sudo eopkg -y bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/desktop/font/mscorefonts/pspec.xml
sudo eopkg -y it mscorefonts*.eopkg;sudo rm mscorefonts*.eopkg
echo "--------------------- done ---------------------"


## system cleanup

echo "--------------------- cleaning up ---------------------"
sudo eopkg -y rmo
echo "--------------------- cleaned :) ---------------------"



echo "--------------------- please reboot ---------------------" && exit 0
