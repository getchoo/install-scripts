#!/bin/sh

export ZDOTDIR=$HOME/.config/zsh

rm -rf $ZDOTDIR/themes/powerlevel10k

git clone https://github.com/romkatv/powerlevel10k.git $ZDOTDIR/themes/powerlevel10k

cd ~/dev/git/powerlevel10k 

git checkout $(curl -s https://api.github.com/repos/romkatv/powerlevel10k/releases/latest \
| grep "tag_name" \
| sed 's/\"\|\"\|:\|tag_name\|,\|\ //g')
