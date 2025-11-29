#!/bin/bash

sudo mount -t nfs 192.168.50.224:/mounted $REMOTE_PATH

if [[ $? -ne 0 ]]; then
	# unmount if already mounted
	echo "Unmounting existing sshfs mount..."
fi

project=$(ls -1 $REMOTE_PATH/$NAME/projects/py_3.10 | fzf --prompt='Select project: ')

if [[ -z "${project:-}" ]]; then
  echo "No project selected. Exiting."
  exit 1
fi

nvim -n $REMOTE_PATH/$NAME/projects/py_3.10/"$project"
