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


## add packages i do like

echo "--------------------- installing packages ---------------------"
sudo eopkg -y it curl discord fish flatpak git neofetch neovim p7zip wget zsh
echo "--------------------- base packages installed ---------------------"


## setup packager stuff

echo "--------------------- setting up packager enviorment ---------------------"
sudo eopkg it -c system.devel
sudo eopkg it solbuild solbuild-config-unstable
sudo solbuild init
sudo solbuild update
mkdir -p ~/src/solbuild
git clone https://dev.getsol.us/source/common.git ~/src/solbuild/common
ln -sv ~/src/solbuild/common/Makefile.common ~/src/solbuild/.
ln -sv ~/src/solbuild/common/Makefile.toplevel ~/src/solbuild/Makefile
ln -sv ~/src/solbuild/common/Makefile.iso ~/src/solbuild/.
echo "--------------------- done ---------------------"


## install flathub repo

echo "--------------------- installing flathub repo ---------------------"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "--------------------- flathub repo installed ---------------------"


## change shells

echo "--------------------- changing shell ---------------------"
chsh -s /usr/bin/fish
echo "--------------------- done ---------------------"


## install shell package managers
echo "--------------------- installing shell plugin managers ---------------------"
curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh | zsh
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish
echo "--------------------- done ---------------------"


## install dotfiles

echo "--------------------- installing dotfiles ---------------------"
curl -SsLO https://starship.rs/install.sh
sh install.sh -b /usr/bin
patch -R -p1 < patches/solus.patch
cp -r dotfiles/. ~/
rm -rf install.sh dotfiles/.config/solus
echo "--------------------- done ---------------------"


## install fonts

echo "--------------------- installing fonts ---------------------"
sudo wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P /usr/share/fonts/truetype/
sudo eopkg -y bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/desktop/font/mscorefonts/pspec.xml
sudo eopkg -y it mscorefonts*.eopkg;sudo rm mscorefonts*.eopkg
echo "--------------------- done ---------------------"


## system cleanup

echo "--------------------- cleaning up ---------------------"
sudo eopkg -y rmo
echo "--------------------- cleaned :) ---------------------"


echo "--------------------- please reboot ---------------------" && exit 0
