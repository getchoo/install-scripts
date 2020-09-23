#!/bin/bash



## upgrade system

echo "--------------------- upgrading initial system ---------------------"
sudo eopkg -y up
echo "--------------------- inital upgrade complete ---------------------"
clear


## remove packages i dont like

echo "--------------------- removing package ---------------------"
sudo eopkg -y rm hexchat libreoffice-common rhythmbox thunderbird
echo "--------------------- base packages removed ---------------------"
clear


## add packages i do like

echo "--------------------- installing packages ---------------------"
sudo eopkg -y it curl discord flatpak git neofetch neovim p7zip wget zsh
echo "--------------------- base packages installed ---------------------"
clear


## setup packager stuff

echo "--------------------- setting up packager enviorment ---------------------"
sudo eopkg it -c system.devel
sudo eopkg it solbuild solbuild-config-unstable
sudo solbuild init
sudo solbuild update
mkdir -p ~/dev/solbuild
git clone https://dev.getsol.us/source/common.git ~/dev/solbuild/
ln -sv ~/dev/solbuild/common/Makefile.common ~/dev/solbuild/.
ln -sv ~/dev/solbuild/common/Makefile.toplevel ~/dev/solbuild/Makefile
ln -sv ~/dev/solbuild/common/Makefile.iso ~/dev/solbuild/.
echo "--------------------- done ---------------------"
clear


## install flathub repo

echo "--------------------- installing flathub repo ---------------------"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "--------------------- flathub repo installed ---------------------"
clear


## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/zsh
echo "--------------------- done ---------------------"
clear


## install dotfiles

echo "--------------------- installing dotfiles ---------------------"
cp -r dotfiles/. ~/
rm -rf ~/.config/autostart/script.desktop ~/.zprofile
cat dotfiles/.zprofile | sudo tee -a /usr/share/defaults/etc/profile
echo "--------------------- done ---------------------"
clear


## install fonts

echo "--------------------- installing fonts ---------------------"
sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P /usr/share/fonts/truetype/
sudo eopkg -y bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/desktop/font/mscorefonts/pspec.xml
sudo eopkg -y it mscorefonts*.eopkg;sudo rm mscorefonts*.eopkg
echo "--------------------- done ---------------------"
clear


## final system upgrade and cleanup

echo "--------------------- upgrading system ---------------------"
sudo eopkg -y up
echo "--------------------- system upgraded ---------------------"
clear
echo "--------------------- cleaning up ---------------------"
sudo eopkg -y rmo
echo "--------------------- cleaned :) ---------------------"
clear
echo "--------------------- final upgrade complete and orphan packages removed ---------------------"
clear


echo "--------------------- done ---------------------" && exit 0
