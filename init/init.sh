#!/bin/bash
set -e

echo "init.sh install"
bash psp.sh
bash ppa.sh

bash vimrc.sh
bash gitconfig.sh
git pullall

# YCM Install
##echo "YCM install"
##cd ~/.files/bundle/YouCompleteMe
##./install.sh --clang-completer

cd ~/.files/init
sudo bash pip.sh    # install python deps PIP
bash extra.sh       # make user as sudoer

cd ~
rm -rf .bashrc
ln -sf .files/bashrc .bashrc
rm -rf .bash_aliases
ln -sf .files/aliases .bash_aliases

# Docker User Group
sudo addgroup docker
sudo usermod -a -G docker $USER

