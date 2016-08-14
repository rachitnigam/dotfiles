#!/bin/bash
set -eu
wd=$(pwd)
echo $wd

if ! hash vim; then
  echo "vim missing. Install vim to continue. Exiting..."
  exit 1
fi

echo "Setting up basic file"
ln -sv $wd/bashrc $HOME/.bashrc
ln -sv $wd/vimrc $HOME/.vimrc
ln -sv $wd/vim $HOME/.vim
ln -sv $wd/gitconfig $HOME/.gitconfig

echo "Setting up git"
git config --global user.email "rachit.nigam12@gmail.com"
git config --global user.name "thEnigma"
