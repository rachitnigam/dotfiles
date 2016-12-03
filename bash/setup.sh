#!/bin/bash
set -eu
wd=$(pwd)
echo "Setting up .bashrc file"
cat $wd/bashrc >> $HOME/.bashrc
