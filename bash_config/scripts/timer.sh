MINUTES=$1
MINUTES=$(($MINUTES * 60))
sleep $MINUTES && notify-send "Alarm 1"
paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
