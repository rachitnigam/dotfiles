#!/bin/bash
wd=$(pwd)

# Who am I?
me=`basename $0`

# Get options.
LNOPTS=""
if [ $# -gt 0 ]; then
    if [[ "$1" == "-f" ]]; then
        LNOPTS="-f"
    else
        echo "Unrecognized option: $1"
        cat << EOF
Usage: $me [OPTIONS]

    Options:
    -f    Force 'ln' to create a new link, even if one already exists with the
          same name.
EOF
        exit 1
    fi
fi

if ! hash vim; then
    echo "vim missing. Install vim to continue. Exiting..."
    exit 1
fi

echo "Setting up basic file"
mkdir -p $HOME/.vim/{backup,swap,undo}

# If Vim-Plug is not already exist, get it using curl
if [ ! -d  $HOME/.vim/autoload/plug.vim ]; then

    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    if [ "$?" -ne 0 ]; then
        echo 'Failed to install Vim-plug.'
        exit 1
    fi

fi

# Install vim-plug plugins
set -x SHELL bash; vim $wd/vim-plug.vim +PlugInstall! +PlugClean +qall

if [ "$?" -eq 0 ]; then
    # If vim-plug successfully installs plugins, link the .vimrc
    ln -s $LNOPTS $wd/vimrc $HOME/.vimrc
    ln -s $LNOPTS $wd/vim-plug.vim $HOME/vim-plug.vim
    echo 'Vim configuration complete'
else
    echo 'Vim-Plug failed to install plugins!'
fi
