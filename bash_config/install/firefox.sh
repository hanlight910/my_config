sudo snap remove firefox
sudo add-apt-repository ppa:mozillateam/ppa
sudo echo "Package: firefox*\
Pin: release o=LP-PPA-mozillateam\
Pin-Priority: 501" > /etc/apt/preferences.d/mozillateamppa
sudo apt install firefox
