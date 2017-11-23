#!/bin/bash

if ! pgrep i3lock > /dev/null; then

  i3lock -n -i $HOME/Pictures/lock-background.png \
    --insidecolor=373445ff --ringcolor=ffffffff --line-uses-inside \
    --keyhlcolor=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 \
    --insidevercolor=fecf4dff --insidewrongcolor=d23c3dff \
    --ringvercolor=ffffffff --ringwrongcolor=ffffffff --indpos="x+145:y+1670" \
    --radius=17 --veriftext="" --wrongtext=""

  sleep 15; pgrep i3lock && xset dpms force off
fi
