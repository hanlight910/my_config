#!/bin/bash
mkdir -p ~/Pictures/resources
FILE=~/Pictures/resources/$(date +%Y%m%d_%H%M%S).png
gnome-screenshot -a -f $FILE

echo -n $FILE | xclip -sel clip

