#!/bin/bash



## upgrade system

echo "--------------------- upgrading system ---------------------"
sudo dnf update -y
sudo dnf upgrade -y
clear
echo "--------------------- initial system upgrade complete ---------------------"


## add rpm repos

echo "--------------------- installing rpmfusion repos ---------------------"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y 
sudo dnf install rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data -y 
clear
echo "--------------------- rpmfusion repos installed ---------------------"


## add flathub

echo "--------------------- adding flathub repo ---------------------"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
flatpak update
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
sudo dnf install htop vim -y
sudo dnf copr enable atim/nushell -y && sudo dnf install nushell -y
flatpak update
flatpak install flathub com.spotify.client
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
chsh -s /bin/nu
clear
echo "--------------------- done ---------------------" 


## customize zsh

# echo "--------------------- cusotmizing zsh.... ---------------------"	
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# upgrade_oh_my_zsh
# git clone https://github.com/ryanoasis/nerd-fonts.git
# mkdir ~/.local/share/fonts
# cp nerd-fonts/patched-fonts/Hack/Regular/complete/'Hack Regular Nerd Font Complete.ttf' ~/.local/share/fonts
# clear
# echo "--------------------- done ---------------------"


## upgrade system again

echo "--------------------- updating ---------------------"
sudo dnf update -y
sudo dnf upgrade -y
clear
echo "--------------------- system upgraded ---------------------"


#remove orphans 

echo "--------------------- removing orphans ---------------------"
sudo dnf autoremove -y
clear
echo "--------------------- orphan packages deleted ---------------------"



echo "--------------------- please reboot ---------------------" && exit 0
