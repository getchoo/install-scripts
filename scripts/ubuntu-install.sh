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
sudo apt install neofetch git vim zsh -y
clear
echo "--------------------- packages installed ---------------------"


## install flatpak apps

echo "--------------------- installing flatpak apps ---------------------"
sudo apt install flatpak gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install com.dropbox.Client -y
flatpak install com.spotify.Client -y
flatpak install com.discordapp.Discord -y
clear
echo "--------------------- flatpak apps installed ---------------------"


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
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
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
