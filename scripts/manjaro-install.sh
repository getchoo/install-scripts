#!/bin/bash

sudo pacman -Sy --noconfirm
echo "initial repositories installed"

sudo pacman -Rns --noconfirm hplip htop kconnect kget khelpcenter kwalletmanager konversation system-config-printer skanlite spectacle thunderbird yakuake steam-manjaro imagewriter qt5-tools
echo "extra packages removed"

sudo pacman -Syyu --noconfirm
echo "system upgraded"

pacman -Rns --noconfirm $(pacman -Qtdq)
echo "orphan packages removed"

sudo pacman -S yay ranger flameshot gimp zsh vim wine winetricks
echo "packages installed"

sudo pacman -Syyu --noconfirm
echo "final repo sync complete"

echo "done" && exit 0
