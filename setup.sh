#!/bin/bash

sudo apt install neovim
DOT_FILES=(".vimrc" ".config")
CUR_DIRES=`pwd`
for file in ${DOT_FILES[@]}
do 
    ln -s -f $CUR_DIR/$file $HOME/$file
done

DEIN_FILES=("init.vim" "dein.toml" "dein_lazy.toml")

if [[ ! -e $HOME/.config ]]; then
    mkdir $HOME/.config/nvim
fi 

for file in ${DEIN_FILES[@]}
do
    ln -s -f $CUR_DIR/$file $HOME/.config/nvim/
done
