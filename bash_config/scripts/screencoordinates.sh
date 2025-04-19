while true; do
  eval $(xdotool getmouselocation --shell)
  notify-send "Pointer" "X=$X  Y=$Y"
  sleep 0.5
done

