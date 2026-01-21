#!/bin/bash

CONFIG_FILE="$HOME/archive/03-RESOURCES/client.ovpn"

# Kill existing openvpn processes first
if pgrep -x openvpn > /dev/null; then
    echo "Stopping existing openvpn processes..."
    sudo pkill -x openvpn
    sleep 2
fi

# Start openvpn
echo "Starting VPN..."
sudo openvpn --daemon --config "$CONFIG_FILE"

# Wait and check if tunnel is established
for i in {1..10}; do
    sleep 1
    if ip addr show tun0 &>/dev/null; then
        echo "VPN connected successfully!"
        ip addr show tun0 | grep -E "inet "
        exit 0
    fi
    echo -n "."
done

echo ""
echo "VPN connection failed. Check logs with: sudo journalctl -u openvpn -f"
exit 1

