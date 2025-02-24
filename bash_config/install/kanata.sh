cargo install kanata

mkdir ~/.config/systemd/user/ -p

# user wide
cp $CONFIG/kanata/kanata.service ~/.config/systemd/user/

# system-wide during booting process to active during login session
sudo cp $CONFIG/kanata/kanata.service /etc/systemd/system/kanata.service
