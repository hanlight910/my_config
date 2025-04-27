#!/bin/bash
#
# # Store the grep output in a variable
# pdf_window=$(wmctrl -l | grep pdf)
#
# if [[ -z "$pdf_window" ]]; then
#     # Get the last window and focus it
#     last_window=$(wmctrl -l | tail -n 1 | awk '{print $1}')
#     wmctrl -ia "$last_window"
# else
#     # Focus the last matching PDF window
# 	count=$(wmctrl -l | grep -c pdf)
# 	if [ $count -eq 1 ]; then
# 		last_window=$(wmctrl -l | tail -n 1 | awk '{print $1}')
# 		wmctrl -ia "$last_window"
# 	else
# 		last_pdf_window=$(echo "$pdf_window" | tail -n 1 | awk '{print $1}')
# 		wmctrl -ia "$last_pdf_window"
# 	fi
# fi

last_window=$(wmctrl -l | grep pdf | head -n 2 | tail -n 1 | awk '{print $1}')
wmctrl -ia "$last_window"
