#!/bin/bash

# get path from clip
xclip_path="$(xclip -o -selection clipboard)"
source "$HOME/.my_config/bash_config/bash_path.sh"

# Load environment variables (including OPENAI_API_KEY)
set -a
source "$HOME/.my_config/bash_config/.env"
set +a

notify-send "LLM OCR" "Processing..."
result=$("$PY_HOME/venv/bin/python3" "$PY_HOME/my_ai/llm_ocr.py" "$xclip_path")
echo "$result" | xclip -selection clipboard
notify-send "LLM OCR" "Done"
