#!/bin/bash

TARGET="dmlab_5G"

if nmcli dev wifi list | grep -q "$TARGET"; then
	CURRENT=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)
	SIGNAL=$(nmcli -t -f SSID,SIGNAL dev wifi list | grep "^$TARGET:" | head -n 1 | cut -d: -f2)

	# Connect if not already connected and signal is good (>50)
	if [ "$CURRENT" != "$TARGET" ] && [ -n "$SIGNAL" ] && [ "$SIGNAL" -gt 50 ]; then
		nmcli con up "$TARGET" >/dev/null 2>&1
	fi
fi

