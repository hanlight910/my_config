#!/bin/bash

events=$(gcalcli --nocolor agenda --nostarted now +5m | grep -v "No Events Found")

if [ -n "$events" ]; then
    # Extract first event or all if you prefer
    event_msg=$(echo "$events")

    # Display full event info in a desktop notification
    notify-send -t 1000 "📅 Upcoming GCal Event" "$event_msg"

    # Play a loud/noticeable sound using a custom file or built-in system sound
    # Try each command in order, use a loud one
    (paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga 2>/dev/null || \
     aplay /usr/share/sounds/alsa/Front_Center.wav 2>/dev/null || \
     canberra-gtk-play --id="bell" 2>/dev/null) &
fi

