#!/bin/bash

if ! pgrep i3lock > /dev/null; then
  i3lock -f -k -i ~/Pictures/heart.png --datesize=1 --timesize=72 --wrongtext="" --veriftext="" -f

  sleep 30; pgrep i3lock && xset dpms force off
fi
