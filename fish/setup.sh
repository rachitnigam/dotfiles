#!/usr/local/bin/fish
wd=(pwd)
echo "Setting up .bashrc file"
ln -sv $wd/fish/functions $HOME/.config/fish/functions
ln -sv $wd/fish/config.fish $HOME/.config/fish/config.fish
