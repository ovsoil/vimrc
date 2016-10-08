#!/usr/bin/env bash

RC=$(readlink $HOME/.vimrc)

if [ "$RC" = "$HOME/Repo/fisa-vim-config/.vimrc" ]; then
    echo "toggle to ovsoil-vim-config"
    ln -sf $HOME/Repo/vimrc/vimrc-dev $HOME/.vimrc
    rm -f $HOME/.vim
    ln -sf $HOME/Backup/vim/vim-ovsoil $HOME/.vim
else
    echo "toggle to fisa-vim-config"
    ln -sf $HOME/Repo/fisa-vim-config/.vimrc $HOME/.vimrc
    rm -f $HOME/.vim
    ln -sf $HOME/Backup/vim/vim-fisa $HOME/.vim
fi
