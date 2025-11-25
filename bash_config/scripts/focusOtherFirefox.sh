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

# 개인보다 중앙 교통대란, 
# 전체적인 시스템을
# 
# 교통 시스템 전체를 최적화하고
# '인간의 실수'로 인한 
# 비효율(사고, 유령 정체)을 제거

