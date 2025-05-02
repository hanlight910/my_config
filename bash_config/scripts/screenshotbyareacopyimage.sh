#!/bin/bash

FILE=~/Pictures/Screenshots/$(dateformat.sh).png
gnome-screenshot -a -f $FILE

while [ ! -f "$FILE" ]; do
    sleep 0.1
done
xclip -sel clip -t image/png -i $FILE 
