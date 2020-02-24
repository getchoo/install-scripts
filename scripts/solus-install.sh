#!/bin/bash

sudo eopkg rm hexchat libreoffice-common thunderbird -y
echo "base packages removed"

sudo eopkg up -y
echo "inital upgrade complete"

sudo eopkg it neofetch transmission albert menulibre vim -y
clear
echo "base packages installed"

sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/desktop/font/mscorefonts/pspec.xml -y
sudo eopkg it mscorefonts*.eopkg -y;sudo rm mscorefonts*.eopkg -y
clear
echo "third party packages installed"

sudo eopkg ur -y
sudo eopkg up -y
sudo eopkg rmo -y
clear
echo "final upgrade complete and orphan packages removed"

echo "done" && exit 0
