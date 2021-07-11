#!/bin/sh

# # #
# g3tchoo's pop os install script
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


## remove packages i dont like

echo "--------------------- installing packages ---------------------"
sudo apt remove -y libreoffice-*
echo "--------------------- packages installed ---------------------"


## install packages i like

echo "--------------------- installing packages ---------------------"
sudo apt -y install bat exa neovim ttf-mscorefonts-installer ubuntu-restricted-extras zsh
echo "--------------------- packages installed ---------------------"


## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/zsh
echo "--------------------- done ---------------------"


## install dotfiles
 
echo "--------------------- installing dotfiles ---------------------"
cp -r dotfiles/. ~/
$HOME/.local/bin/clean-home
echo "--------------------- done ---------------------"


## install fonts

echo "--------------------- installing fonts ---------------------"
sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P /usr/share/fonts/truetype/
echo "--------------------- done ---------------------"


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt -y autoremove
sudo apt -y clean
echo "--------------------- final system cleaned up ---------------------"



echo "--------------------- please reboot ---------------------" && exit 0
