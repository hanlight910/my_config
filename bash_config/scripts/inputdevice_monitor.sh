#!/bin/bash

# Define the name of the device you want to monitor
DEVICE_NAME="foostan_Corne_v4" # Replace with the actual device name

# log directory
LOG_PATH="$HOME/logs/"
mkdir LOG_PATH -p
LOG_PATH="$LOG_PATH/inputdevice_monitor"

# Start monitoring for device events
INPUT_DEVICE_FOUNDED=0
IDX=0
udevadm monitor --subsystem-match=input --property | while read line; do
	# echo "<<<<<<<<<<<<<<$line>>>>>>>>>>>>>>>>>" >> udev.log
    # if echo "$line" | grep -q "ID_INPUT=1"; then
	if [ $IDX -gt 3 ]; then
		IDX=0
		INPUT_DEVICE_FOUNDED=0
	fi
	if echo "$line" | grep -q "ACTION=add"; then
		INPUT_DEVICE_FOUNDED=1;
		# Run the script when the device is added
		# $SCRIPT_ON_ADD
		continue
	elif echo "$line" | grep -q "ACTION=remove"; then
		INPUT_DEVICE_FOUNDED=2;
		# Run the script when the device is removed
		# $SCRIPT_ON_REMOVE
		continue
	fi
	if [ $INPUT_DEVICE_FOUNDED -gt 0 ]; then
		if echo "$line" | grep -q "NAME=\"foostan Corne v4\"" ; then
			if [ $INPUT_DEVICE_FOUNDED -eq 1 ]; then
				echo "$(date '+%Y-%m-%d %H:%M') - Device $DEVICE_NAME added" >> $LOG_PATH
				INPUT_DEVICE_FOUNDED=0;
				kanatacorne.sh
				# read -s -p "Enter password" PASSWORD
				# wait till user input the passord
				# Run the script when the device is added

			elif [ $INPUT_DEVICE_FOUNDED -eq 2 ]; then
				echo "$(date '+%Y-%m-%d %H:%M') - Device $DEVICE_NAME removed" >> $LOG_PATH
				INPUT_DEVICE_FOUNDED=0;
				kanatageneral.sh
				# Run the script when the device is removed
				# $SCRIPT_ON_REMOVE
			fi
		else
			echo "$(date '+%Y-%m-%d %H:%M') - err!!!: $line" >> $LOG_PATH
		fi 
		((IDX++))
	fi
done
