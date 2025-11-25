#!/bin/bash
source "$HOME/.my_config/bash_config/bash_path.sh"
source "$HOME/.my_config/bash_config/.env"
LOG_FILE="/home/light/Downloads/clip_llm.log"

echo "PY_HOme: $PY_HOME" > $LOG_FILE

# Run Python script and capture output & errors
"$PY_HOME/venv/bin/python3" "$PY_HOME/myai/mygemini.py" >> "$LOG_FILE" 2>&1
PY_EXIT=$?  # Save exit code

# Log the processing attempt
echo "$(date) - Processed clipboard content with LLM, exit code: $PY_EXIT" >> "$LOG_FILE"

# Notify user
if [ $PY_EXIT -eq 0 ]; then
    notify-send "Clip LLM" "Content sent to LLM successfully."
else
    notify-send "Clip LLM" "Failed to send content to LLM. Check log for details."
fi

