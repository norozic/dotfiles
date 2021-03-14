#!/bin/bash
DOTPATH=~/dotfiles
DOTURL=https://github.com/hezrq/dotfiles

yay -S alsa-utils --noconfirm
yay -S asdf --noconfirm
yay -S clang --noconfirm
yay -S curl --noconfirm
yay -S direnv --noconfirm
yay -S doas --noconfirm
yay -S dunst --noconfirm
yay -S exa --noconfirm
yay -S file --noconfirm
yay -S fzf --noconfirm
yay -S gcc --noconfirm
yay -S gef-git --noconfirm
yay -S ghq --noconfirm
yay -S git --noconfirm
yay -S glibc --noconfirm
yay -S htop --noconfirm
yay -S make --noconfirm
yay -S neofetch --noconfirm
yay -S nvim --noconfirm
yay -S python-pip --noconfirm
yay -S tig --noconfirm
yay -S unzip --noconfirm
yay -S which --noconfirm
yay -S zsh --noconfirm
yay -Syyu --noconfirm

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
/bin/bash ./bin/gef.sh
/bin/bash ./bin/git.sh
/bin/bash ./bin/git-credential-helper.sh
/bin/bash ./bin/tig.sh
