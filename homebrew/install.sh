#!/bin/bash

sudo cat /dev/null

if [ -d /home/linuxbrew ]; then
  :
else
  echo 'Installing Homebrew...'
  sudo git clone https://github.com/Homebrew/brew /home/linuxbrew/.linuxbrew/Homebrew
  if [ "$(uname)" == 'Darwin'  ]; then
    sed -i 's/\/home/#\/home/g' /etc/auto_master
  fi
  sudo mkdir /home/linuxbrew/.linuxbrew/bin
  sudo ln -sfv /home/linuxbrew/.linuxbrew/Homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin
fi

if [ -f $HOME/.profile ]; then
  sed -e '$a export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' $HOME/.profile -i
else
  echo export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH" > $HOME/.profile
fi

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

echo 'Installing tools...'

## Not WSL
shopt -s nocasematch
if [ ! "`uname -a | grep "microsoft"`" ]; then
  brew install docker
  brew install docker-compose
fi

brew install git
brew install gcc
brew install curl
brew install bat
brew install exa
brew install fd
brew tap cjbassi/ytop
brew install ytop

if [ ! "`sudo fd`" ]; then
  touch ~/sudoers.tmp ~/sudoers.bak
  sudo cat /etc/sudoers > ~/sudoers.bak
  sudo sed "/secure_path/s/^/# /g" /etc/sudoers > ~/sudoers.tmp
  echo "Defaults        env_keep +="PATH"" >> ~/sudoers.tmp
  full_path=$(find ~ -name sudoers.tmp)
  sudo bash -c "cat $full_path > /etc/sudoers"
  rm ~/sudoers.tmp ~/sudoers.bak
fi

fish -c 'git config --global core.excludesfile $DOTPATH/configs/.gitignore_global'
