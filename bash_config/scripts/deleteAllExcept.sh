#!/bin/bash

FILE_NAME="$1"
if [ -z "$FILE_NAME" ]; then
  echo "Usage: $0 <filename_to_keep>"
  exit 1
fi

find . ! -name "$FILE_NAME" -delete

