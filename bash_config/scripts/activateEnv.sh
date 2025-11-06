#!/bin/bash

# active env find from current directory to root, deep = 5

DEEP=5
DIR=$(pwd)
for ((i=0; i<DEEP; i++)); do
	# check .venv or ./venv
	if [ -d "$DIR/.venv" ]; then
		source "$DIR/.venv/bin/activate"
		echo "Activated virtual environment from $DIR/venv"
		# exit 0
	fi
	if [ -d "$DIR/venv" ]; then
		source "$DIR/venv/bin/activate"
		echo "Activated virtual environment from $DIR/venv"
		# exit 0
	fi
	if [ "$DIR" == "/" ]; then
		break
	fi
	DIR=$(dirname "$DIR")
done
