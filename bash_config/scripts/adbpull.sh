#!/bin/bash

echo "Screenshot: 0"
echo "Camera: 1"
read -p "input: " option
read -p "range(1~n): " range
read -p "Choose directory option (1 = default path, 0 = current directory): " target_path_option

source ~/.my_config/bash_config/bash_path.sh

if [[ $option -eq 0 ]]; then
	REMOTE_DIR="/sdcard/DCIM/Screenshots"
	latest_file="$(adb shell ls -t "$REMOTE_DIR" | head -n 1)"
	ext="${latest_file##*.}"

	if [[ $target_path_option -eq 1  ]]; then

		TARGET=$(date +"%Y%m%d_%H%M%S")

		target_epoch=$(date -d "${TARGET:0:8} ${TARGET:9:2}:${TARGET:11:2}:${TARGET:13:2}" +%s)
		# Directory where files are on device
		FILE=Screenshot-$(date +%Y%m%d_%H%M%S)


		if [[ -n $latest_file ]]; then
			adb pull "$REMOTE_DIR/$latest_file" "$IMAGE_RESOURCE"
			mv "$IMAGE_RESOURCE/$latest_file" "$IMAGE_RESOURCE/$FILE.$ext"
			echo -n "$IMAGE_RESOURCE/$FILE.$ext" | xclip -sel clip
		fi
	else
		adb pull "$REMOTE_DIR/$latest_file" "./"
	fi
else
	REMOTE_DIR="/sdcard/DCIM/Camera"
	if [[ $target_path_option -eq  1 ]]; then

		adb shell "ls -t \"$REMOTE_DIR\"" | head -n $range | while read file; do
		adb pull "$REMOTE_DIR/$file" "$IMAGE_RESOURCE"
		open "$IMAGE_RESOURCE/file"
	done
else
	adb shell "ls -t \"$REMOTE_DIR\"" | head -n $range | while read file; do
	adb pull "$REMOTE_DIR/$file" "./"
	open "$IMAGE_RESOURCE/file"
done

	fi
fi
