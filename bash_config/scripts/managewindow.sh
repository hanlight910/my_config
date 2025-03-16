#!/bin/bash
# Move the emulator window to workspace 2 and raise it without focusing it
WINDOW_ID=$(wmctrl -l | grep "Android Emulator" | awk '{print $1}')
EMULATOR=$(wmctrl -l | grep "Emulator" | awk '{print $1}')
echo $WINDOW_ID
EMULATOR=$(echo $EMULATOR | awk '{print $1}')
echo $EMULATOR
wmctrl -ir $WINDOW_ID -b add,above   # Raise window without focusing
wmctrl -ir $WINDOW_ID -b remove,focused
wmctrl -ir $EMULATOR -b remove,focused

TERMINAL_ID=$(wmctrl -l | head -n 1 | awk '{print $1}')
# Refocus the terminal window (replace with your terminal or other window name)
# xdotool windowfocus $(xdotool search --name "Terminal" | head -n 1)

xdotool windowactivate $TERMINAL_ID
# xdotool windowfocus $TERMINAL_ID
#!/bin/bash

while true; do
    CUR_WORKSPACE=$(wmctrl -d | grep '\*' | awk '{print $1}')
    
    if [ "$CUR_WORKSPACE" -eq "1" ]; then  # Workspace 2 (index starts at 0)
        sleep 0.3  # Small delay to prevent conflicts
        xdotool windowactivate $TERMINAL_ID
    fi

    sleep 1  # Check every second
done
