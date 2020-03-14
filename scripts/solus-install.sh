#!/bin/bash



## upgrade system

echo "--------------------- upgrading initial system ---------------------"
sudo eopkg up -y
clear
echo "--------------------- inital upgrade complete ---------------------"


## remove packages i dont like

echo "--------------------- removing package ---------------------"
sudo eopkg rm hexchat libreoffice-common thunderbird -y
clear 
echo "--------------------- base packages removed ---------------------"


## add packages i do like

echo "--------------------- installing packages ---------------------"
sudo eopkg it git neofetch vim zsh gtkhash nautilus-dropbox flatpak -y
clear
echo "--------------------- base packages installed ---------------------"


## install flatpak apps

echo "--------------------- installing flathub repo ---------------------"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
clear 
echo "--------------------- flathub repo installed ---------------------"


## install microsoft fonts

echo " --------------------- installing microsoft fonts ---------------------"
sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/desktop/font/mscorefonts/pspec.xml -y
sudo eopkg it mscorefonts*.eopkg -y;sudo rm mscorefonts*.eopkg -y
clear
echo "--------------------- third party packages installed ---------------------"


## set new shell for user

echo "--------------------- setting new shell for user ---------------------"
chsh -s /bin/zsh
clear
echo "--------------------- done ---------------------" 


## add dotfiles

echo "--------------------- adding dotfiles ---------------------"
mkdir ~/tmp
git clone https://github.com/sethfl/dotfiles.git ~/tmp/
cd ~/tmp/
cp -r home/. ~
cd ~
rm -rf tmp
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
clear
echo "--------------------- done ---------------------"


## final system upgrade and cleanup

echo "--------------------- upgrading system ---------------------"
sudo eopkg ur -y
sudo eopkg up -y
echo "--------------------- system upgraded ---------------------"
echo "--------------------- cleaning up ---------------------"
sudo eopkg rmo -y
echo "--------------------- cleaned :) ---------------------"
clear
echo "--------------------- final upgrade complete and orphan packages removed ---------------------"



echo "--------------------- done ---------------------" && exit 0
