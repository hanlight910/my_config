FILE=~/Pictures/resources/$(date +%Y%m%d_%H%M%S).png
gnome-screenshot -w -f $FILE
echo -n $FILE | xclip -sel clip 
open $FILE
