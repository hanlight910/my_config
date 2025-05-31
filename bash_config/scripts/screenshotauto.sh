#!/bin/bash

# Get mouse position
eval "$(xdotool getmouselocation --shell)"

# Get all window geometries (window id, x, y, width, height)
wmctrl -lG | while read -r wid desktop x y w h rest; do
  if [ "$X" -ge "$x" ] && [ "$X" -le "$((x + w))" ] &&
     [ "$Y" -ge "$y" ] && [ "$Y" -le "$((y + h))" ]; then
    TIMESTAMP=$(date +%s)
    import -window "$wid" "$HOME/Pictures/window_$TIMESTAMP.png"
    notify-send "Captured window under cursor"
    exit 0
  fi
done

echo "No window found under cursor."

