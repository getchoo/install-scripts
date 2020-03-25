#!/bin/bash



## append dnf.conf

sudo bash -c 'echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf'
sudo bash -c 'echo "fastestmirror=True" >> /etc/dnf/dnf.conf'

## upgrade system

echo "--------------------- upgrading system ---------------------"
sudo dnf update -y
sudo dnf upgrade -y
clear
echo "--------------------- initial system upgrade complete ---------------------"


## add rpm repos

echo "--------------------- installing extra repos ---------------------"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core
clear
echo "--------------------- extra repos installed ---------------------"


## add flathub

echo "--------------------- adding flathub repo ---------------------"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
clear
echo "--------------------- flathub repo installed ---------------------"


## restart gnome-software

echo "--------------------- restarting gnome software ---------------------"
killall gnome-software
rm -rf ~/.cache/gnome-software
clear
echo "--------------------- gnome software reloaded ---------------------"


## install packages

echo "--------------------- installing packages ---------------------"
sudo dnf remove libreoffice-x11
sudo dnf install htop neovim zsh -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client
flatpak install flathub com.discordapp.Discord
clear 
echo "--------------------- apps installed ---------------------"


## install fedy

echo "--------------------- installing fedy ---------------------"
sudo dnf copr enable kwizart/fedy
sudo dnf install fedy -y
clear
echo "--------------------- fedy installed ---------------------"


## edit plymouth

echo "--------------------- changing plymouth theme ---------------------" 
sudo dnf install plymouth-theme-charge -y
sudo plymouth-set-default-theme charge -R
clear
echo "plymouth themed changed to charge. initrd rebuilt."


## set new shell for user

echo "--------------------- setting new shell for user ---------------------"
chsh -s /bin/zsh
clear
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
echo "--------------------- done ---------------------"


## install sauce code pro font

echo "--------------------- installing sauce code pro font ---------------------"
sudo wget -P /usr/share/fonts/saucecodepro https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf   
echo "--------------------- installed sauce code pro font ---------------------"


## upgrade system again

echo "--------------------- updating ---------------------"
sudo dnf update -y
clear
echo "--------------------- system upgraded ---------------------"


#remove orphans 

echo "--------------------- removing orphans ---------------------"
sudo dnf autoremove -y
clear
echo "--------------------- orphan packages deleted ---------------------"



echo "--------------------- please reboot ---------------------" && exit 0
