#!/bin/bash

source ~/.my_config/bash_config/bash_path.sh
# Define target timestamp
TARGET=$(date +"%Y%m%d_%H%M%S")

target_epoch=$(date -d "${TARGET:0:8} ${TARGET:9:2}:${TARGET:11:2}:${TARGET:13:2}" +%s)
# Directory where files are on device
REMOTE_DIR="/sdcard/DCIM/Screenshots"
FILE=Screenshot-$(date +%Y%m%d-%H%M%S)

latest_file="$(adb shell ls -t "$REMOTE_DIR" | head -n 1)"
ext="${latest_file##*.}"

# Get list of files
if [[ -n $latest_file ]]; then
	adb pull "$REMOTE_DIR/$latest_file" "$IMAGE_RESOURCE"
	mv "$IMAGE_RESOURCE/$latest_file" "$IMAGE_RESOURCE/$FILE.$ext"
	echo -n "$IMAGE_RESOURCE/$FILE.$ext" | xclip -sel clip
fi

