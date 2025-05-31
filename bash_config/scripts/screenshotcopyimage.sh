#!/bin/bash
FILE=$IMAGE_RESOURCE/$(date +%Y%m%d_%H%M%S).png
gnome-screenshot -w -f $FILE 

while [ ! -f "$FILE" ]; do sleep 0.1; done

xclip -sel clip -t image/png -i "$FILE"

