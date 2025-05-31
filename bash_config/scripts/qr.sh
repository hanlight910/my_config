
qrencode -o myqr.png "$1"

echo "$PWD/myqr.png" | xclip -sel clip

