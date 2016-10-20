#!/bin/bash
wd=$(pwd)

if ! hash vim; then
  echo "vim missing. Install vim to continue. Exiting..."
  exit 1
fi

if ! hash git; then
  echo "git missing. Install git to continue. Exiting..."
  exit 1
fi

echo "Setting up basic file"
cp $wd/vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/{backup,swap,undo}
if [ $? -eq 0 ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  if [ $? -eq 0 ]; then
    set -x SHELL bash; vim +BundleInstall! +BundleClean +qall
    if [ $? -eq 0 ]; then
      cat $wd/vim_rest >> $HOME/.vimrc
      echo 'vim configured'
    else
      echo 'Vundle failed to install packages. Fix issues and run :PluginInstall from vim'
    fi
  else
    echo 'Failed to install Vundle. Removing .vimrc and aborting'
    rm $HOME/.vimrc
    exit 1
  fi
else
  echo 'Failed to create new .vimrc. Aborting...'
  exit 1
fi

echo "Setting up git"
cp $wd/gitconfig $HOME/.gitconfig
git config --global user.email "rachit.nigam12@gmail.com"
git config --global user.name "thEnigma"

echo 'Setting up tmux.conf'
cp $wd/tmux.conf $HOME/.tmux.conf
