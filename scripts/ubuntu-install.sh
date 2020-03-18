#!/bin/bash



## inital upgrade
echo "--------------------- upgrading system ---------------------"
sudo apt update -y
sudo apt upgrade -y
clear
echo "--------------------- system upgraded ---------------------"


## remove orphans

echo "--------------------- removing orphans ---------------------"
sudo apt autoremove -y
clear
echo "--------------------- orphans removed ---------------------"


## install packages i like

echo "--------------------- installing packages ---------------------"
sudo apt install neofetch git vim zsh nautilus-dropbox wget -y
clear
echo "--------------------- packages installed ---------------------"


## install snap apps

echo "--------------------- installing snap apps ---------------------"
sudo snap install spotify
sudo snap install discord
echo "--------------------- snap apps installed ---------------------"


## set new shell for user

echo "--------------------- setting new shell for user ---------------------"
chsh -s /bin/zsh
clear
echo "--------------------- done ---------------------" 

## add dotfiles

echo "--------------------- adding dotfiles ---------------------"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
mkdir ~/tmp
git clone https://github.com/sethfl/dotfiles.git ~/tmp
cd ~/tmp
cp -r home/. ~/
cd ~
rm -rf tmp
clear
echo "--------------------- done ---------------------"


## final system upgrade

echo "--------------------- upgrade ---------------------"
sudo apt update -y
sudo apt full-upgrade -y
clear
echo "--------------------- final system update complete ---------------------"


## cleaning up

echo "--------------------- cleaning up ---------------------"
sudo apt autoremove -y
sudo apt clean -y
sudo apt update -y
clear
echo "--------------------- final system cleaned up ---------------------"


echo "--------------------- done ---------------------"



echo "--------------------- please reboot ---------------------" && exit 0
