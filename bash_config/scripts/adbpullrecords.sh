#!/bin/bash

# decreasing order
FILE=$(adb shell "ls sdcard/Recordings/Voice\ Recorder" | fzf --prompt="Select a recording to pull > " --tac)

if [ -z "$FILE" ]; then
	echo "No file selected. Exiting."
	exit 1
fi
DESTINATION_DIR="$(find $ARCHIVE_PATH -type d | fzf)"
adb pull "sdcard/Recordings/Voice Recorder/$FILE" "$DESTINATION_DIR"

open "$DESTINATION_DIR/$FILE"
