#!/bin/bash

FILE_PATH=$(realpath "$1")

TARGET_FILE="$TEMP_DIR/$(basename "$FILE_PATH" .md).pptx"

mkdir -p "$TEMP_DIR"

# md to pptx
pandoc "$FILE_PATH" -o "$TARGET_FILE" --from markdown --to pptx --slide-level=2
# Convert to pdf
libreoffice --headless --convert-to pdf "$TARGET_FILE" --outdir "$TEMP_DIR"
rm "$TARGET_FILE"

# Open the pdf file
xdg-open "${TARGET_FILE%.pptx}.pdf"

