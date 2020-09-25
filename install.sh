#!/bin/sh

if test ! -f ~/.local/share/nvim/site/autoload/plug.vim; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim -c 'PlugInstall!'
fi

stow -t $HOME nvim i3 topgrade
