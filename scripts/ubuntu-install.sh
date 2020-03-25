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
sudo apt install neofetch git neovim zsh wget ttf-mscorefonts-installer p7zip-full -y
clear
echo "--------------------- packages installed ---------------------"


## replace snap with flatpak

echo "--------------------- installing snap apps ---------------------"
sudo apt purge snapd
sudo apt install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install com.spotify.Client com.discordapp.Discord
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


## install sauce code pro font

echo "--------------------- installing sauce code pro font ---------------------"
sudo wget -P /usr/share/fonts/saucecodepro https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf   
echo "--------------------- installed sauce code pro font ---------------------"


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
clear
echo "--------------------- final system cleaned up ---------------------"


echo "--------------------- done ---------------------"



echo "--------------------- please reboot ---------------------" && exit 0
