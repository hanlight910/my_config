#!/bin/bash

TARGET="dmlab_5G"

if nmcli dev wifi list | grep -q "$TARGET"; then
	CURRENT=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)

	if [ "$CURRENT" != "$TARGET" ]; then
		nmcli con up "$TARGET" >/dev/null 2>&1
	fi
fi

