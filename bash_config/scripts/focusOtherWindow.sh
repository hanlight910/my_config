#!/bin/bash

output=$(wmctrl -l | grep -Ev 'BDHF|Firefox|workspace|sub|pdf')
if [ -z "$output" ]; then
  output=$(wmctrl -l | grep -Ev 'BDHF|Firefox|workspace|sub')
fi
inode=$(echo "$output" | tail -n 1 | awk '{print $1}')

wmctrl -ia $inode
