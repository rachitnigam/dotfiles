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
cp $wd/vimrc.plugins $HOME/.vimrc
mkdir -p $HOME/.vim/{backup,swap,undo}
if [ $? -eq 0 ]; then
  if [ ! -d $HOME/vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/vim/bundle/Vundle.vim
  fi
  if [ $? -eq 0 ]; then
    set -x SHELL bash; vim +BundleInstall! +BundleClean +qall
    if [ $? -eq 0 ]; then
      mv $HOME/.vimrc $HOME/.vimrc.plugins
      cp $wd/vimrc $HOME/.vimrc
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
