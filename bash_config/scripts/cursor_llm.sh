#!/bin/bash
# Script to copy paragraph at cursor, run LLM, and paste result back

LOG_FILE="/home/light/Downloads/cursor_llm.log"
echo "$(date) - Starting cursor LLM process" > "$LOG_FILE"

# Select all text in current input field at typing cursor
# First move to start of field, then select to end
xdotool key --clearmodifiers ctrl+Home
sleep 0.05
xdotool key --clearmodifiers ctrl+shift+End
sleep 0.1

# Copy the selected content
xdotool key --clearmodifiers ctrl+c
sleep 0.3

# Get the copied content for logging
COPIED_CONTENT=$(xclip -selection clipboard -o 2>/dev/null)
echo "Copied content: $COPIED_CONTENT" >> "$LOG_FILE"

# Run the LLM processing script and wait for it to complete
"$HOME/.my_config/bash_config/scripts/clip_llm.sh"
LLM_EXIT=$?

# Log the LLM exit status
echo "LLM processing exit code: $LLM_EXIT" >> "$LOG_FILE"

# Only paste if LLM processing was successful
if [ $LLM_EXIT -eq 0 ]; then
    # Small delay to ensure clipboard is updated
    sleep 0.2

    # Paste result at current typing cursor position
    xdotool key --clearmodifiers ctrl+shift+v

    echo "$(date) - Cursor LLM process completed successfully" >> "$LOG_FILE"
else
    echo "$(date) - Cursor LLM process failed, not pasting" >> "$LOG_FILE"
fi
