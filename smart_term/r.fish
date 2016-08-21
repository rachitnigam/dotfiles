#! /usr/local/usr/fish

set dir (python ~/smart_term/recent.pyc $argv)
if [ $dir != $PWD ]
  cd $dir
end
