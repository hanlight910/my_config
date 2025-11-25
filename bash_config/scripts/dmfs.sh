#!/bin/bash

sshfs "$DMSSH:/home/$NAME" $REMOTE_PATH 

if [[ $? -ne 0 ]]; then
	# unmount if already mounted
	echo "Unmounting existing sshfs mount..."
	fusermount -u $REMOTE_PATH
fi

project=$(ssh "$DMSSH" "ls -1 ~/projects/py_3.10" | fzf --prompt='Select project: ')

if [[ -z "${project:-}" ]]; then
  echo "No project selected. Exiting."
  exit 1
fi

nvim $REMOTE_PATH/projects/py_3.10/"$project"
