#!/bin/sh

export ZDOTDIR=$HOME/.config/zsh

THEMELOCATION=$ZDOTDIR/themes/powerlevel10k

rm -rf $THEMELOCATION

git clone https://github.com/romkatv/powerlevel10k.git $THEMELOCATION

cd $THEMELOCATION 

git checkout $(curl -s https://api.github.com/repos/romkatv/powerlevel10k/releases/latest \
| grep "tag_name" \
| sed 's/\"\|\"\|:\|tag_name\|,\|\ //g')
