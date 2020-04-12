#!/bin/bash



## append dnf.conf

echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf
clear


## upgrade system

echo "--------------------- upgrading system ---------------------"
sudo dnf -y upgrade
echo "--------------------- initial system upgrade complete ---------------------"
clear


## add rpm repos

echo "--------------------- installing extra repos ---------------------"
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y groupupdate core
echo "--------------------- extra repos installed ---------------------"
clear


## install codecs
echo "--------------------- installing multimedia codecs ---------------------"
sudo dnf -y groupupdate multimedia
sudo dnf -y groupupdate sound-and-video
echo "--------------------- done ---------------------"
clear


## disable mouse acceleration
echo "--------------------- disabling mouse acceleration --------------------- "
cat > /etc/X11/xorg.conf.d/50-mouse-acceleration.conf <<EOF
Section "InputClass"
	Identifier "Fedy Mouse Configuration - Disable mouse acceleration"
	MatchIsPointer "yes"
	Option "AccelerationProfile" "-1"
	Option "AccelerationScheme" "none"
	Option "AccelSpeed" "-1"
EndSection
EOF
echo "--------------------- done ---------------------"
clear


## install packages

echo "--------------------- installing packages ---------------------"
sudo dnf -y remove libreoffice-x11
sudo dnf -y install htop lpf-mscore-fonts mpd ncmpcpp neovim p7zip zsh
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak -y install flathub com.axosoft.GitKraken com.discordapp.Discord 
echo "--------------------- apps installed ---------------------"
clear


## upgrade system again

echo "--------------------- updating ---------------------"
sudo dnf -y update
echo "--------------------- system upgraded ---------------------"
clear


#remove orphans

echo "--------------------- removing orphans ---------------------"
sudo dnf -y autoremove
echo "--------------------- orphan packages deleted ---------------------"
clear


echo "--------------------- please reboot ---------------------" && exit 0
