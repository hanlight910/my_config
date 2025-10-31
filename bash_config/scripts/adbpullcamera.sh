#!/bin/bash

# decreasing order
SRC_PATH="sdcard/DCIM/Camera"
FILE=$(adb shell "ls -t -1 sdcard/DCIM/Camera" | fzf --multi)

if [ -z "$FILE" ]; then
	echo "No file selected. Exiting."
	exit 1
fi

DEST_PATH=./

# File might contain multiple lines
for f in $FILE; do
	adb pull "$SRC_PATH/$f" "$DEST_PATH"
done
	

