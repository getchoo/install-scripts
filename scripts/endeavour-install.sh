#!/bin/bash



## initial upgrade

echo "--------------------- updating system ---------------------"
sudo pacman -Syyu
clear
echo "--------------------- system updated ---------------------"


## delete packages i dont like
 
echo "--------------------- deleting extra packages ---------------------"
sudo pacman -Rns epiphany gnome-books gnome-calculator gnome-boxes gnome-calendar gnome-contacts gnome-getting-started-docs gnome-maps gnome-multi-writer gnome-music gnome-nettool gnome-todo gnome-packagekit hardinfo xterm gnome-software gnome-software-packagekit-plugin 
clear
echo "--------------------- packages deleted ---------------------"


## install packages i do like

echo "--------------------- installing packages ---------------------"
sudo pacman -S yay ranger gimp vim zsh flatpak alacarte git
yay -S bauh pamac-aur gnome-session-properties ttf-ms-fonts
clear
echo "--------------------- packages installed---------------------"


## install flathub repo

echo "--------------------- installing flathub repo ---------------------"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
clear
echo "--------------------- flathub repo installed ---------------------"


## set new shell for user

echo "--------------------- setting new shell for user ---------------------"
chsh -s /bin/zsh
echo "--------------------- done ---------------------" 


## add dotfiles

echo "--------------------- adding dotfiles ---------------------"
mkdir ~/tmp
git clone https://github.com/sethfl/dotfiles.git ~/tmp/
cd ~/tmp/
cp -r home/. ~
cd ~
rm -rf tmp
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
clear
echo "--------------------- done ---------------------"


## remove orphans
echo "--------------------- removing orphans ---------------------"
sudo pacman -Rns --noconfirm $(pacman -Qtdq)
clear
echo "orphans removed"


## final update
echo "updating system again"
sudo pacman -Syyu --noconfirm
echo "done"


echo "script complete" && exit 0

