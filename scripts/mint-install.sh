#!/bin/bash



## initial upgrade

echo "--------------------- upgrading system ---------------------"
sudo apt upgdate
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
sudo apt install gtkhash seashorse git vim
echo "--------------------- done ---------------------"
clear


## clean up

echo "--------------------- cleaning up system ---------------------"
sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo apt clean
echo "--------------------- done ---------------------"
clear



echo "done" && exit 0
