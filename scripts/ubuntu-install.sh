#!/bin/sh



## inital upgrade

echo "--------------------- upgrading system ---------------------"
sudo apt -y update
sudo apt -y upgrade
echo "--------------------- system upgraded ---------------------"


## install packages i like

echo "--------------------- installing packages ---------------------"
sudo apt -y install curl git neofetch neovim p7zip-full ppa-purge ttf-mscorefonts-installer ubuntu-restricted-extras wget zsh
echo "--------------------- packages installed ---------------------"


## replace snap with flatpak

echo "--------------------- installing flatpak apps ---------------------"
sudo apt -y purge snapd
sudo apt -y install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.discordapp.Discord
echo "--------------------- flatpak apps installed ---------------------"


## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/zsh
echo "--------------------- done ---------------------"


## install dotfiles
 
echo "--------------------- installing dotfiles ---------------------"
cp -r dotfiles/. ~/
rm -rf ~/LICENSE
rm -rf ~/.git
rm -rf ~/.gitmodules
echo "--------------------- done ---------------------"


## install fonts

echo "--------------------- installing fonts ---------------------"
sudo wget https:/ithub.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P /usr/share/fonts/truetype/
echo "--------------------- done ---------------------"


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt -y autoremove
sudo apt -y clean
echo "--------------------- final system cleaned up ---------------------"



echo "--------------------- please reboot ---------------------" && exit 0
