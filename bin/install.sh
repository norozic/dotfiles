#!/bin/bash
DOTPATH=~/dotfiles
DOTURL=https://github.com/hezrq/dotfiles

pacman -Syyu --noconfirm
if type "sudo" > /dev/null 2>&1; then
  :
else
  pacman -S sudo --noconfirm
fi
sudo pacman -S asdf --noconfirm
sudo pacman -S clang --noconfirm
sudo pacman -S curl --noconfirm
sudo pacman -S direnv --noconfirm
sudo pacman -S exa --noconfirm
sudo pacman -S file --noconfirm
sudo pacman -S fzf --noconfirm
sudo pacman -S gcc --noconfirm
sudo pacman -S ghq --noconfirm
sudo pacman -S git --noconfirm
sudo pacman -S glibc --noconfirm
sudo pacman -S htop --noconfirm
sudo pacman -S make --noconfirm
sudo pacman -S neofetch --noconfirm
sudo pacman -S nvim --noconfirm
sudo pacman -S python-pip --noconfirm
sudo pacman -S tig --noconfirm
sudo pacman -S unzip --noconfirm
sudo pacman -S which --noconfirm
sudo pacman -S zsh --noconfirm

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
if [ ! -d $HOME/.config/ ]; then
  mkdir $HOME/.config
fi

/bin/bash $DOTPATH/bin/link.sh $DOTPATH/.config/* ~/.config/

/bin/bash ./bin/zsh.sh
/bin/bash ./bin/nvim.sh
/bin/bash ./bin/deno.sh
/bin/bash ./bin/rust.sh
/bin/bash ./bin/git.sh
/bin/bash ./bin/git-credential-helper.sh
/bin/bash ./bin/tig.sh
