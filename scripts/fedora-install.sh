#!/bin/bash



## append dnf.conf

echo "--------------------- editing dnf settings ---------------------"  
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf
echo "--------------------- done ---------------------"
clear


## upgrade system

echo "--------------------- upgrading system ---------------------"
sudo dnf -y upgrade
echo "--------------------- done ---------------------"
clear


## add rpm repos

echo "--------------------- installing extra repos ---------------------"
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y groupupdate core
echo "--------------------- done ---------------------"
clear


## install packages

echo "--------------------- installing packages ---------------------"
sudo dnf -y remove libreoffice-x11
sudo dnf -y install curl fedy git lpf-mscore-fonts neovim p7zip wget zsh
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak -y install flathub com.discordapp.Discord
echo "--------------------- done ---------------------"
clear


## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/zsh
echo "--------------------- done ---------------------"
clear


## install dotfiles

echo "--------------------- installing dotfiles ---------------------"
cp -r dotfiles/. ~/
echo "@reboot /home/seth/.zprofile" | sudo tee /var/spool/cron/seth
echo "--------------------- done ---------------------"
clear


## install fonts

echo "--------------------- installing fonts ---------------------"
sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P /usr/share/fonts/truetype/
echo "--------------------- done ---------------------"
clear


#remove orphans

echo "--------------------- removing orphans ---------------------"
sudo dnf -y autoremove
echo "--------------------- orphan packages deleted ---------------------"
clear



echo "--------------------- please reboot ---------------------" && exit 0
