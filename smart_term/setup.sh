#!/bin/bash
set -eu
wd=$(pwd)

ln -s $wd/smart_term

echo '
export LASTDIR="/"
 
function prompt_command {
 
  # Record new directory on change.
  newdir=`pwd`
  if [ ! "$LASTDIR" = "$newdir" ]; then
    /path/to/markdir.pl
 
    # List contents:
    ls -t | head -7
  fi
 
  export LASTDIR=$newdir
}
 
export PROMPT_COMMAND="prompt_command"
' >> $HOME/.bashrc
