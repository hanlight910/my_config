#!/bin/bash
FILE=~/Pictures/Screenshots/Screenshot-$(date +%Y%m%d-%H%M%S).png
gnome-screenshot -w -f $FILE 

while [ ! -f "$FILE" ]; do sleep 0.1; done

xclip -sel clip -t image/png -i "$FILE"

