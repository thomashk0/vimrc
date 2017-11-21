#!/bin/sh

current_dir=$(pwd)
mkdir -p vim

# Creating symbolik links
ln -sf $SCRIPT_PATH/minimal ~/.vimrc
ln -sf $SCRIPT_PATH/vimrc.bundles ~/.vimrc.bundles
ln -sf $SCRIPT_PATH/vimrc.bepo ~/.vimrc.bepo
ln -sf $SCRIPT_PATH/vim ~/.vim

git clone http://github.com/VundleVim/Vundle.Vim ~/.vim/bundle/Vundle.vim

vim -u $SCRIPT_PATH/vimrc.install +PluginInstall

popd > /dev/null
