#!/bin/bash

# Get PDF path from clipboard
pdf_path="$(xclip -o -selection clipboard)"
source "$HOME/.my_config/bash_config/bash_path.sh"

# Load environment variables (including OPENAI_API_KEY)
set -a
source "$HOME/.my_config/bash_config/.env"
set +a

tmpfile=$(mktemp)
trap 'xclip -selection clipboard < "$tmpfile"; rm -f "$tmpfile"; notify-send "PDF to MD" "Done"' EXIT

notify-send "PDF to MD" "Processing..."
"$PY_HOME/venv/bin/python3" "$PY_HOME/my_ai/pdf_to_md.py" "$pdf_path" > "$tmpfile"
