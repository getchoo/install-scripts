#!/bin/bash



## inital upgrade

echo "--------------------- upgrading system ---------------------"
sudo apt -y update
sudo apt -y upgrade
echo "--------------------- system upgraded ---------------------"
<<<<<<< Updated upstream
clear
=======
<<<<<<< HEAD
=======
clear
>>>>>>> 2ba498dbed08f594edda4162543e92067346f84d
>>>>>>> Stashed changes


## install packages i like

echo "--------------------- installing packages ---------------------"
sudo apt -y install curl git neofetch neovim ppa-purge wget zsh
echo "--------------------- packages installed ---------------------"
<<<<<<< Updated upstream
clear
=======
<<<<<<< HEAD
=======
clear
>>>>>>> 2ba498dbed08f594edda4162543e92067346f84d
>>>>>>> Stashed changes


## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/zsh
echo "--------------------- done ---------------------"
<<<<<<< Updated upstream
clear
=======
<<<<<<< HEAD
=======
clear
>>>>>>> 2ba498dbed08f594edda4162543e92067346f84d
>>>>>>> Stashed changes


## install dotfiles
 
echo "--------------------- installing dotfiles ---------------------"
<<<<<<< Updated upstream
cp -r dotfiles/. ~/
echo "--------------------- done ---------------------"
clear
=======
<<<<<<< HEAD
curl -fsSL https://starship.rs/install.sh | bash
cp -r dotfiles/. ~/
echo "--------------------- done ---------------------"
=======
cp -r dotfiles/. ~/
echo "--------------------- done ---------------------"
clear
>>>>>>> 2ba498dbed08f594edda4162543e92067346f84d
>>>>>>> Stashed changes


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt -y autoremove
sudo apt -y clean
echo "--------------------- final system cleaned up ---------------------"
<<<<<<< Updated upstream
clear
=======
<<<<<<< HEAD
=======
clear
>>>>>>> 2ba498dbed08f594edda4162543e92067346f84d
>>>>>>> Stashed changes



echo "--------------------- please reboot ---------------------" && exit 0
