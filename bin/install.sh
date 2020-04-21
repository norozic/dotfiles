#!/bin/bash

DOTPATH=~/dotfiles/
DOTURL=https://github.com/mtiyz/dotfiles.git

if type "apt" > /dev/null 2>&1; then
  if type "sudo" > /dev/null 2>&1; then
    :
  else
    apt install sudo -y
  fi
  sudo apt install build-essential curl file git -y
fi

if type "yum" > /dev/null 2>&1; then
  if type "sudo" > /dev/null 2>&1; then
    :
  else
    yum install sudo -y
  fi
  sudo yum groupinstall 'Development Tools' -y
  sudo yum install curl git m4 ruby bzip2-devel curl-devel expat-devel ncurses-devel zlib-devel openssl-devel which -y
  sudo yum install texinfo -y
  sudo yum install libxcrypt-compat -y
  sudo yum install util-linux-user -y
fi

if type "git" > /dev/null 2>&1; then
  if [ -d $DOTPATH ]; then
    cd $DOTPATH && git pull
  else
    git clone $DOTURL $DOTPATH
  fi
else
  echo "Require git"
  exit 1
fi

cd $DOTPATH
/bin/bash ./homebrew/install.sh
/bin/bash ./fish/install.sh
