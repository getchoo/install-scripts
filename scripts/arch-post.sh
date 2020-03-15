#!/bin/bash 



## set new shell 

echo "--------------------- setting new shell for user ---------------------"
sudo pacman -S zsh git
chsh -s /bin/zsh
#clear
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



## finish up
echo "--------------------- done ---------------------" && exit 0
