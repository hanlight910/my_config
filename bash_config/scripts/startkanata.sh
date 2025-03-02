#!/bin/bash
# exit if return value is non-zero
set -e
cp $CONFIG/kanata/kanata_corne.service ~/.config/systemd/user/

# system-wide during booting process to active during login session
sudo cp $CONFIG/kanata/kanata_corne.service /etc/systemd/system/kanata.service

if [ $? -ne 0 ]; then
	exit
fi
# systemctl --user daemon-reload
# systemctl --user restart kanata
sudo systemctl daemon-reload
sudo systemctl restart kanata

