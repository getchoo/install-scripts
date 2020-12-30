#!/bin/bash



## append dnf.conf

echo "--------------------- editing dnf settings ---------------------"  
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf
echo "--------------------- done ---------------------"



## upgrade system

echo "--------------------- upgrading system ---------------------"
sudo dnf -y upgrade
echo "--------------------- done ---------------------"



## add rpm repos

echo "--------------------- installing extra repos ---------------------"
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y groupupdate core
echo "--------------------- done ---------------------"



## install packages

echo "--------------------- installing packages ---------------------"
sudo dnf -y remove libreoffice-x11
sudo dnf -y install curl fedy fish git lpf-mscore-fonts neovim p7zip wget zsh
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak -y install flathub com.discordapp.Discord
echo "--------------------- done ---------------------"



## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/fish
echo "--------------------- done ---------------------"



## install shell package managers
echo "--------------------- installing shell plugin managers ---------------------"
curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh | zsh
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
echo "--------------------- done ---------------------"



## install dotfiles

echo "--------------------- installing dotfiles ---------------------"
curl -fsSL https://starship.rs/install.sh | bash
cp -r dotfiles/. ~/
echo "--------------------- done ---------------------"



## install fonts

echo "--------------------- installing fonts ---------------------"
sudo wget https:/ithub.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P /usr/share/fonts/truetype/
echo "--------------------- done ---------------------"



#remove orphans

echo "--------------------- removing orphans ---------------------"
sudo dnf -y autoremove
echo "--------------------- orphan packages deleted ---------------------"




echo "--------------------- please reboot ---------------------" && exit 0
