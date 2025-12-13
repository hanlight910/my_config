#!/bin/bash

output=$(wmctrl -l | grep -Ev 'BDHF|Firefox|workspace|sub|pdf|Desktop Icons')

wmctrl -i -a "$(echo "$output" | awk 'NR==1 {print $1}')"

# if echo "$output" | grep -q "Select Window"; then
# 	wmctrl -a "Select Window"
# 	exit 0
# fi
#
# valid_windows=$(echo "$output" | awk '$1 !~ /^-1/')
#
# titles=()
# while read -r line; do
#     winid=$(echo "$line" | awk '{print $1}')
#     title=$(echo "$line" | awk '{$1=$2=$3=""; print substr($0,4)}' | xargs)
#     if [[ -n "$title" ]]; then
#         titles+=("$title|$winid")
#     fi
# done <<< "$valid_windows"
#
# zenity_titles=()
# for t in "${titles[@]}"; do
#     IFS="|" read -r title id <<< "$t"
#     zenity_titles+=("$title")
# done
#
# choice=$(zenity --list \
#     --title="Select Window" \
#     --text="Choose a window to focus:" \
#     --column="Windows" \
#     --width=400 \
#     --height=300 \
#     "${zenity_titles[@]}")
#
# if [ -n "$choice" ]; then
#     for t in "${titles[@]}"; do
#         IFS="|" read -r title id <<< "$t"
#         if [[ "$title" == "$choice" ]]; then
#             wmctrl -ia "$id"
#             break
#         fi
#     done
# fi

