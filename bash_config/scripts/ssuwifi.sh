#!/bin/bash
# SSUWIFI Manual Connector
# Interface: wlp2s0

echo "[*] Stopping NetworkManager..."
sudo systemctl stop NetworkManager
sudo killall wpa_supplicant

echo "[*] Connecting to WiFi (SSUWIFI)..."
sudo ip link set wlp2s0 up
# Note: You may need to update the BSSID if the AP changes
sudo iw dev wlp2s0 connect -w SSUWIFI 40:E3:D6:CC:C1:C0

echo "[*] Requesting IP..."
sudo dhclient -v wlp2s0

echo "[*] Setting University DNS..."
echo "nameserver 219.250.36.130" | sudo tee /etc/resolv.conf

echo "[*] Done. Open Firefox to: http://neverssl.com"

