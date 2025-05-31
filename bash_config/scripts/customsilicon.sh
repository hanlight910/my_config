FILE=$IMAGE_RESOURCE/Screenshot-$(date +%Y%m%d-%H%M%S).png

if [[ -n "$1" ]]; then
	silicon --from-clipboard --language $1 -o $FILE
	echo -n $FILE | xclip -sel clip 
fi




