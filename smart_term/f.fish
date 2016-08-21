#!/usr/local/bin/fish

set dir (python ~/smart_term/freq.pyc $argv)
if [ $dir != $PWD ]
  cd $dir
end
