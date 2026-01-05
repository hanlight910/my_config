#!/bin/bash

# Check if the directory is already mounted
if mountpoint -q "$REMOTE_PATH" 2>/dev/null; then
	echo "Directory is already mounted at $REMOTE_PATH"
else
	echo "Mounting NFS share..."
	sudo mount -t nfs -o soft,nolock 192.168.50.224:/mounted/hanvit $REMOTE_PATH

	if [[ $? -ne 0 ]]; then
		echo "Failed to mount NFS share"
		exit 1
	fi
	echo "Successfully mounted to $REMOTE_PATH"
fi

project=$(ls -1 $REMOTE_PATH/projects/py_3.10 | fzf --prompt='Select project: ')

if [[ -z "${project:-}" ]]; then
  echo "No project selected. Exiting."
  exit 1
fi

nvim -n $REMOTE_PATH/projects/py_3.10/"$project"
