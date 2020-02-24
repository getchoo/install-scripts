#!/bin/bash

sudo apt remove thunderbird hexchat rhythmbox -y
sudo dpkg -r gnome-games -y
sudo apt update
sudo apt autoremove -y
sudo apt update
echo "extra packages removed"

sudo sed -i 's/buster/sid/g' /etc/apt/sources.list
echo "repos switched to sid"

sudo apt update -y
sudo apt full-upgrade -y
echo "system upgraded"

sudo apt install chromium -y
sudo apt remove firefox-esr -y
sudo apt install neofetch htop transmission firefox git make flatpak gnome-software-plugin-flatpak -y
sudo apt remove chromium -y
echo "packages installed"

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
flatpak update
flatpak install flathub com.spotify.client -y
flatpak install com.discordapp.Discord -y
echo "flatpak apps installed"

killall gnome-software
rm -rf ~/.cache/gnome-software
echo "gnome software reloaded"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
echo "oh my bash installed"

sudo apt update -y
sudo apt full-upgrade -y
echo "final system update complete"

sudo apt autoremove -y
sudo apt clean -y
echo "final system cleaned up"

echo "please reboot" && exit 0
