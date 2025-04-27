#!/bin/bash

# context=$1
# time=$2
# month=$3
# day=$4
#
# gcalcli --calendar 'school class calender' quick "$context at $time on $month $day"

read -p "Title: " title
read -p "When (e.g., tomorrow 5pm): " when
read -p "Duration (in minutes): " duration
gcalcli add --title "$title" --when "$when" --duration "$duration"
