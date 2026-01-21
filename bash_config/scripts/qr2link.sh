#!/bin/bash

# Decode QR code image from clipboard (file path) and extract the link/text
# Dependencies: xclip, zbar-tools (zbarimg)

# Get image path from clipboard
IMAGE_PATH=$(xclip -selection clipboard -o 2>/dev/null | tr -d '\n')

if [ -z "$IMAGE_PATH" ]; then
    notify-send "QR Decode" "No path found in clipboard" -u critical
    exit 1
fi

# Handle file:// URI prefix
IMAGE_PATH="${IMAGE_PATH#file://}"

if [ ! -f "$IMAGE_PATH" ]; then
    notify-send "QR Decode" "File not found: $IMAGE_PATH" -u critical
    exit 1
fi

# Decode QR code
RESULT=$(zbarimg -q --raw "$IMAGE_PATH" 2>/dev/null)

if [ -z "$RESULT" ]; then
    notify-send "QR Decode" "No QR code found in image" -u critical
    exit 1
fi

# Copy result to clipboard and notify
echo -n "$RESULT" | xclip -selection clipboard
notify-send "QR Decode" "$RESULT"
