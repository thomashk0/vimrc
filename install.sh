#!/bin/sh


pushd `dirname $0` > /dev/null
SCRIPT_PATH=`pwd`
mkdir -p $SCRIPT_PATH/vim/bundle

# Creating symbolik links
ln -sf $SCRIPT_PATH/vimrc ~/.vimrc
ln -sf $SCRIPT_PATH/vimrc.bundles ~/.vimrc.bundles
ln -sf $SCRIPT_PATH/vimrc.bepo ~/.vimrc.bepo
ln -sf $SCRIPT_PATH/vim ~/.vim

git clone http://github.com/VundleVim/Vundle.Vim ~/.vim/bundle/Vundle.vim

vim -u $SCRIPT_PATH/vimrc.install +PluginInstall

popd > /dev/null
