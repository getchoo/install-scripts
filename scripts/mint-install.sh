#!/bin/bash



## initial upgrade

echo "--------------------- upgrading system ---------------------"
sudo apt update
sudo apt upgrade
sudo apt autoremove
echo "--------------------- done ---------------------"
clear


## remove extras

echo "--------------------- removing extra apps ---------------------"
sudo apt remove hexchat thunderbird libreoffice*
echo "--------------------- done ---------------------"
clear


## add apps

echo "--------------------- install extra apps ---------------------"
sudo apt install gtkhash seahorse git vim
echo "--------------------- done ---------------------"
clear


echo "--------------------- adding dotfiles ---------------------"
mkdir ~/tmp
git clone https://github.com/sethfl/dotfiles.git ~/tmp/
cd ~/tmp/
cp -r home/. ~
cd ~
rm -rf tmp
clear
echo "--------------------- done ---------------------"


## clean up

echo "--------------------- cleaning up system ---------------------"
sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo apt clean
echo "--------------------- done ---------------------"
clear



echo "done" && exit 0
