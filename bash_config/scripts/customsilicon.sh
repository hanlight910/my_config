FILE=~/Pictures/Screenshots/Screenshot-$(date +%Y%m%d-%H%M%S).png

silicon --from-clipboard -l $1 -o $FILE
echo $FILE | xclip -sel clip 


