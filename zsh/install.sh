#!/bin/bash

DOTPATH=~/dotfiles

export PATH="$HOME/.linuxbrew/bin:$PATH"

echo 'Installing zsh...'

brew install zsh

echo 'Installing zinit...'

sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

echo 'Install zsh configs...'
if [ -d ~/.config/zsh/ ]; then
  rm -rf ~/.config/zsh/
fi

mkdir ~/.config/zsh/

$DOTPATH/bin/link.sh $DOTPATH/configs/zsh/.zshrc ~/.config/zsh/.zshrc
$DOTPATH/bin/link.sh $DOTPATH/configs/zsh/.zprofile ~/.config/zsh/.zprofile
$DOTPATH/bin/link.sh $DOTPATH/configs/zsh/.zshenv ~/.config/zsh/.zshenv
$DOTPATH/bin/link.sh $DOTPATH/configs/zsh/.zshenv ~/.zshenv

zsh -c "zinit self-update"

