#!/bin/bash

DOTPATH=~/dotfiles

export PATH="$HOME/.linuxbrew/bin:$PATH"

brew install fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fish

fisher add rafaelrinaldi/pure

rm ~/.config/fish/config.fish
mv $DOTPATH/fish/config.fish ~/.config/fish/config.fish

sudo chsh -s `which fish`
