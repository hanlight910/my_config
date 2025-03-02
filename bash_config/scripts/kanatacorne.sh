sudo cp $CONFIG/kanata/kanata_corne.service /etc/systemd/system/kanata.service
sudo systemctl daemon-reload
sudo systemctl restart kanata
