#!/bin/bash


## inital upgrade
sudo apt update -y
sudo apt upgrade -y
echo "system upgraded"


## remove orphans
echo "removing orphans"
sudo apt autoremove -y
echo "orphans removed"


## install packages i like
echo "installing packages"
sudo apt install neofetch git vim -y
echo "packages installed"


## install flatpak apps
echo "installing flatpak apps..."
sudo apt install flatpak gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install com.dropbox.Client -y
flatpak install com.spotify.Client -y
flatpak install com.discordapp.Discord -y
echo "flatpak apps installed"


## add flatpaks to gnome-software
echo "reloading gnome-software..."
killall gnome-software
rm -rf ~/.cache/gnome-software
echo "gnome software reloaded"


## final system upgrade
echo "upgrade"
sudo apt update -y
sudo apt full-upgrade -y
echo "final system update complete"


## cleaning up
echo "cleaning up..."
sudo apt autoremove -y
sudo apt clean -y
sudo apt update -y
echo "final system cleaned up"


echo "done

echo "please reboot" && exit 0
