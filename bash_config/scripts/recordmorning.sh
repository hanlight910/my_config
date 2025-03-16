#!/bin/bash
RECORDING_PATH="$HOME/projects/py-test/assets/status.csv"
HEAD="Active,Sleep"
if [ ! -f $RECORDING_PATH ]; then
	echo $HEAD > "$RECORDING_PATH"
fi

DATE_FORMAT=$(date +"%Y-%m-%d %H:%M:%S")
lastline=$(tail -n 1 $RECORDING_PATH)

if [ $HEAD == "$lastline" ]; then
	echo "Initialized"
	echo "$DATE_FORMAT" >> $RECORDING_PATH
fi

REGEX_FORMAT='^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}:[0-9]{2}$'
DOUBLE_REGEX='^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}:[0-9]{2}$'

line_counts=$(wc -l < "$RECORDING_PATH")

if [[ $lastline =~ $REGEX_FORMAT ]]; then
	sleep_time=$(echo $lastline | cut -d ',' -f 2)
	active_time=$(echo $lastline | cut -d ',' -f 1)
	sleep_timestamp=$(date -d "$sleep_time" +%s)
	current_timestamp=$(date +%s)
	time_diff=$((current_timestamp - sleep_timestamp))
	time_sleep=$((60 * 60 * 12))
	if [ "$time_diff" -gt $time_sleep ]; then
		echo "record sleep timestamp"
		sed -i "${line_counts} s/.*/$lastline,$DATE_FORMAT/" "$RECORDING_PATH" 
	fi 
	# sed -i "${line_counts}a\$CURRENT_TIME" $RECORDING_PATH
elif [[ $lastline =~ $DOUBLE_REGEX ]]; then
	echo "update active time"
	echo "$DATE_FORMAT" >> "$RECORDING_PATH"
fi
