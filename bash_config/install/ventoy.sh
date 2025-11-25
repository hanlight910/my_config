#!/bin/bash


DISK="/dev/sda"  # replace /dev/sdX with your USB drive
install
echo "[1/3] Downloading Ventoy..."
wget https://sourceforge.net/projects/ventoy/files/v1.1.07/ventoy-1.1.07-linux.tar.gz/download -O ventoy-1.1.07-linux.tar.gz
echo "[2/3] Extracting Ventoy..."
tar -xvzf ventoy-1.1.07-linux.tar.gz
echo "[3/3] Installing Ventoy to USB drive..."
sudo bash ventoy-1.1.07/Ventoy2Disk.sh -i $DISK

# disk must be unmounted including its partitions, unmount all partitions before running the script
# move/copy the iso files to the first partition of the usb drive after installation
ISO_PATH="/home/light/.my_config/bash_config/install/ubuntu-22.04.5-live-server-amd64.iso"

sudo mkdir -p /mnt/usb
echo "[4/4] Copying ISO to Ventoy USB drive..."
sudo mount "${DISK}1" /mnt/usb
echo "Copying $ISO_PATH to USB drive..."
sudo cp "$ISO_PATH" /mnt/usb/
echo "unmounting usb..."
sudo umount /mnt/usb

