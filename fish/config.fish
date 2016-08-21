source ~/.bash_alias

function f
  source ~/smart_term/f.fish $argv
end

function r
  source ~/smart_term/r.fish $argv
end

set lastdir '/'

function dir_changed
  set newdir (pwd)
  if [ $lastdir != $newdir ]
    python ~/smart_term/dircounts.pyc
    set lastdir $newdir
  end
end

function show_git
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p') ""
  if [ $git_branch[1] = "" ]
    echo ""
  else
    set_color 005fff
    echo -n '{ ' 
    set_color af00af
    echo -n 'branch: '
    set_color ff0087
    echo -n "$git_branch; "
    git_status
    set_color 005fff
    echo ' }'
    set_color normal
  end
end

function git_status
  set -l status_val (git status)
  set_color af00af
  echo -n "status: "
  if echo $status_val | grep -q 'up-to-date'
    set_color afff00
    echo -n "up-to-date"
    set_color normal
  else if echo $status_val | grep -q 'ahead'
    set_color 87ffd7
    echo -n "ahead"
    set_color normal
  else if echo $status_val | grep -q 'behind'
    set_color ff5f00
    echo -n "behind"
    set_color normal
  else
    set_color red
    echo -n "unknown"
    set_color normal
  end
end

function fish_prompt
  set_color ff5f00
  echo -n $PWD " " 
  show_git

  set_color 005fff
  echo -n '[ ' 
  set_color afff00
  echo -n (hostname) ' -> ' (whoami) 
  set_color 005fff
  echo -n ' ] ' 
  set_color ff5f00
  echo -n '> '
  set_color normal

  dir_changed
end
