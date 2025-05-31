#!/bin/bash

file_path=$HOME/archive/03-RESOURCES/month.txt

if [ ! -s "$file_path" ]; then
	gcalcli calm > "$file_path"
fi

cat "$file_path"
