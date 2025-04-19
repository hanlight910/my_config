FILE=~/Pictures/resources/Screenshot-$(date +%Y%m%d-%H%M%S).png
gnome-screenshot -w -f $FILE
echo -n $FILE | xclip -sel clip 
open $FILE
