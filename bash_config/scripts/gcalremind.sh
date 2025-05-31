#!/bin/bash
gcalcli agenda --nocolor --nostarted --tsv now 10m | while IFS=$'\t' read -r start end event; do
    notify-send "Calendar Reminder" "$event"
    canberra-gtk-play --file=/usr/share/sounds/freedesktop/stereo/complete.oga
done

