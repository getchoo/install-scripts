#!/bin/bash



## initial upgrade

echo "--------------------- updating system ---------------------"
sudo pacman -Syyu
clear
echo "--------------------- system updated ---------------------"


## delete packages i dont like
 
echo "--------------------- deleting extra packages ---------------------"
sudo pacman -Rns epiphany gnome-books gnome-calculator gnome-boxes gnome-calendar gnome-contacts gnome-getting-started-docs gnome-maps gnome-multi-writer gnome-music gnome-nettool gnome-todo gnome-packagekit hardinfo xterm gnome-software gnome-software-packagekit-plugin 
clear
echo "--------------------- packages deleted ---------------------"


## install packages i do like

echo "--------------------- installing packages ---------------------"
sudo pacman -S yay ranger gimp vim zsh flatpak alacarte git
yay -S bauh pamac-aur gnome-session-properties ttf-ms-fonts
clear
echo "--------------------- packages installed---------------------"


## set new shell for user

echo "--------------------- setting new shell for user ---------------------"
chsh -s /bin/zsh
echo "--------------------- done ---------------------" 


## customize zsh

echo "--------------------- adding papa luke's zsh config ---------------------"	
wget -O ~/.zshrc https://gist.githubusercontent.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52/raw/2a93cca1ea82cecfc2bd6dcd2eff700a95c7581e/zshrc
clear
echo "--------------------- done ---------------------"


## remove orphans
echo "--------------------- removing orphans ---------------------"
sudo pacman -Rns --noconfirm $(pacman -Qtdq)
clear
echo "orphans removed"


## final update
echo "updating system again"
sudo pacman -Syyu --noconfirm
echo "done"


echo "script complete" && exit 0

