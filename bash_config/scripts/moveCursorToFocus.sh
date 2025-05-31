#!/bin/bash

# Get the geometry of the currently active window
eval $(xdotool getactivewindow getwindowgeometry --shell)

# Set the percentage for X and Y positions (50% as an example)
percent_x=50
percent_y=50

# Calculate the target X and Y based on the percentage
target_x=$(($X + $WIDTH * $percent_x / 100))
target_y=$(($Y + $HEIGHT * $percent_y / 100))

# Move the cursor to the calculated position
xdotool mousemove $target_x $target_y
xdotool click 1
