#!/bin/bash

source "$HOME/.my_config/bash_config/bash_path.sh"
source "$ENV"
# Try to find YouTube tab
win_id=$(wmctrl -l | grep -i "YouTube" | tail -n 1 | awk '{print $1}')

if [ -n "$win_id" ]; then
    wmctrl -ia "$win_id"
else
    # Fallback: focus first Firefox tab (replace FIREFOX_TAB1 with actual title/keyword)
    win_id=$(wmctrl -l | grep -i "$FIREFOX_TAB1" | head -n 1 | awk '{print $1}')
    [ -n "$win_id" ] && wmctrl -ia "$win_id"
fi
