#/bin/bash
sudo cp $CONFIG/kanata/kanata_general.service /etc/systemd/system/kanata.service
sudo systemctl daemon-reload
sudo systemctl restart kanata
