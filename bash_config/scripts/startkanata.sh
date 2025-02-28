
cp $CONFIG/kanata/kanata.service ~/.config/systemd/user/

# system-wide during booting process to active during login session
sudo cp $CONFIG/kanata/kanata.service /etc/systemd/system/kanata.service

# systemctl --user daemon-reload
# systemctl --user restart kanata
sudo systemctl daemon-reload
sudo systemctl restart kanata

