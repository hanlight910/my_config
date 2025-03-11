#!/bin/bash
RECORDING_PATH="$HOME/projects/py-test/assets/status.csv"
HEAD="Boot,Sleep"
if [ ! -f $RECORDING_PATH ]; then
	echo $HEAD > "$RECORDING_PATH"
fi

DATE_FORMAT=$(date +"%Y-%m-%d %H:%M:%S")
echo "$DATE_FORMAT"
lastline=$(tail -n 1 $RECORDING_PATH)

if [ $HEAD == "$lastline" ]; then
	echo "Initialized"
	echo "$DATE_FORMAT" >> $RECORDING_PATH
fi

REGEX_FORMAT='^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}:[0-9]{2}$'
DOUBLE_REGEX='^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}:[0-9]{2}$'

line_counts=$(wc -l < "$RECORDING_PATH")
if [[ $lastline =~ $REGEX_FORMAT ]]; then
	echo "store "
	sed -i "${line_counts} s/.*/$lastline,$DATE_FORMAT/" "$RECORDING_PATH" 
	# sed -i "${line_counts}a\$CURRENT_TIME" $RECORDING_PATH
elif [[ $lastline =~ $DOUBLE_REGEX ]]; then
	sleep_time=$(echo $lastline | cut -d ',' -f 2)
	active_time=$(echo $lastline | cut -d ',' -f 1)
	sleep_date=$(echo $sleep_time | cut -d ' ' -f 1)
	current_date=$(echo $DATE_FORMAT | cut -d ' ' -f 1);
	if [ "$current_date" == "$sleep_date" ]; then
		echo "update today time"
		sed -i "${line_counts} s/.*/$active_time,$DATE_FORMAT/" "$RECORDING_PATH"
	else
		echo "$DATE_FORMAT" >> "$RECORDING_PATH"
	fi 
fi
