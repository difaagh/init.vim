#!/bin/bash

# apt install neovim git node go
# Go to home directory
cd ~

# Install neovim git node go
# sudo apt install git

# Create .config/nvim folder if not exists
mkdir -p ~/.config/nvim

# Download init.vim and coc-settings.json from GitHub repository
curl -LJO https://github.com/difaagh/init.vim/raw/main/init.vim
curl -LJO https://github.com/difaagh/init.vim/raw/main/coc-settings.json

mv init.vim ~/.config/nvim/
mv coc-settings.json ~/.config/nvim/

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Open Neovim
nvim +PlugInstall +qall

