echo 'Installing Neovim...'
brew install nvim
pip3 install pynvim

echo 'Installing dein...'
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm ./install.sh

echo 'Installing Neovim configs...'
cp $DOTPATH/configs/nvim/ ~/.config/nvim/
