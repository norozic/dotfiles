#!/bin/bash

DOTPATH=~/dotfiles

export PATH="$HOME/.linuxbrew/bin:$PATH"

echo 'Installing tmux'
brew install tmux

echo 'Installing tmux config...'
if [ -f ~/.tmux.conf ]; then
  rm ~/.tmux.conf
fi
ln -sf $DOTPATH/config/tmux/.tmux.conf ~/.tmux.conf

if ! sudo grep zsh /etc/shells; then
  sudo bash -c "echo `which zsh` | sudo tee -a /etc/shells"
fi

if [ ! "$SHELL" = $(which zsh) ]; then
  echo "You need to change the default shell to $(which zsh)"
fi

if [ -f ~/.tmux.session.conf ]; then
  rm ~/.tmux.session.conf
fi
ln -sf $DOTPATH/config/tmux/.tmux.session.conf ~/.tmux.session.conf

