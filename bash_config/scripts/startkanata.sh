#!/bin/bash
# exit if return value is non-zero
set -e

# system-wide during booting process to active during login session
# sudo cp $CONFIG/kanata/kanata_corne.service /etc/systemd/system/kanata.service

# user-wide during booting process to active during login session


CONFIG=~/.my_config
if grep -q "config_corne" ~/.config/systemd/user/kanata_corne.service; then
	echo "general switched"
	cp $CONFIG/kanata/kanata_general.service ~/.config/systemd/user/kanata_corne.service
else
	echo "corne switched"
	cp $CONFIG/kanata/kanata_corne.service ~/.config/systemd/user/kanata_corne.service
fi

systemctl --user daemon-reload
systemctl --user restart kanata_corne
# sudo systemctl daemon-reload
# sudo systemctl restart kanata
