mkdir -p ~/Pictures/resources
FILE=~/Pictures/resources/$(date +%Y%m%d_%H%M%S).png
gnome-screenshot -a -f $FILE

# xclip -sel clip -t image/png -i $FILE 
# copyq write image/png "$(cat "$FILE")" 
# copyq write image/png < "$FILE"
echo -n $FILE | xclip -sel clip
