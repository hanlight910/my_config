#!/bin/bash

file_path=$HOME/archive/03-RESOURCES/agenda.txt

if [ ! -s "$HOME/archive/03-RESOURCES/agenda.txt" ]; then
	gcalcli agenda > "$file_path"
fi

cat $HOME/archive/03-RESOURCES/agenda.txt
