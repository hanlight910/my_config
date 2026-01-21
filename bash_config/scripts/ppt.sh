#!/bin/bash

# Set full PATH for GNOME keybinding execution
export PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

# ================= CONFIGURATION =================
# Docker Container Name (Default is usually 'windows')
CONTAINER_NAME="WinApps" 

# RDP Credentials
USER="MyWindowsUser"
PASS="asdf"
IP="127.0.0.1"

# Visual Settings
SCALE="180"         # Desktop scaling (200 = 200%)
SIZE="90%"          # Window size

SHARE_PATH="$HOME"
SHARE_NAME="linux_home"
# =================================================

echo "[-] Checking Windows status..."

# 1. Check if the container is running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "[+] Windows is already running."
else
    # Check if container exists but is stopped
    if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
        echo "[!] Windows is stopped. Starting it now..."
        docker start $CONTAINER_NAME
    else
        echo "[X] Error: Container '$CONTAINER_NAME' not found."
        echo "    Run 'docker ps -a' to find the real name and update this script."
        exit 1
    fi
fi

# 2. Wait for RDP Port (3389) to be ready
# Windows takes a few seconds to start the RDP service after boot.
echo "[-] Waiting for RDP connection..."
TIMEOUT=30
while ! nc -z $IP 8006; do
  sleep 1
  TIMEOUT=$((TIMEOUT-1))
  if [ $TIMEOUT -le 0 ]; then
      echo "[X] Timed out waiting for Windows RDP to start."
      exit 1
  fi
done

echo "[+] Ready! Launching PowerPoint..."

# 3. Launch xfreerdp
xfreerdp3 /u:"$USER" /p:"$PASS" /v:$IP /cert:tofu \
    /dynamic-resolution \
    /scale:$SCALE \
    +clipboard \
    /sound \
    /network:lan \
	+grab-keyboard \
	/kbd:layout:0x0412 \
    /drive:$SHARE_NAME,$SHARE_PATH &
