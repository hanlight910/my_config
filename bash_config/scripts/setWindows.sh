#!/bin/bash

# Get window IDs
WORKSPACE_ID="$(wmctrl -l | grep -i 'workspace' | awk '{print $1}')"
YOUTUBE_ID="$(wmctrl -l | grep -i 'youtube' | awk '{print $1}')"
FIREFOX_IDS=($(wmctrl -l | grep -i 'firefox' | awk '{print $1}'))

adjust() {
  echo $(( $1 - 50 ))
}

adj_pos() {
	echo $(( $1 + 100 ))
}

# DisplayPort-0 (main) split horizontally
wmctrl -i -r  "${FIREFOX_IDS[0]}" -b remove,maximized_vert,maximized_horz
wmctrl -i -r "${FIREFOX_IDS[0]}" -e 0,$(adjust 0),$(adjust 0),$(adj_pos 1920),$(adj_pos 2160)              # Left half

wmctrl -i -r  "${FIREFOX_IDS[2]}" -b remove,maximized_vert,maximized_horz
wmctrl -i -r "${FIREFOX_IDS[2]}" -e 0,$(adjust 1920),$(adjust 0),$(adj_pos 1920),$(adj_pos 2160)           # Right half

# DisplayPort-1 (vertical) split vertically
wmctrl -i -r  "${FIREFOX_IDS[1]}" -b remove,maximized_vert,maximized_horz
wmctrl -i -r "${FIREFOX_IDS[1]}" -e 0,$(adjust 3840),$(adjust 0),$(adj_pos 2160),$(adj_pos 1920)           # Top half
wmctrl -i -r  "$YOUTUBE_ID" -b remove,maximized_vert,maximized_horz
wmctrl -i -r "$YOUTUBE_ID" -e 0,$(adjust 3840),$(adjust 1920),$(adj_pos 2160),$(adj_pos 1920)        # Bottom half

# eDP (laptop) workspace window full area
wmctrl -i -r  "$WORKSPACE_ID" -b remove,maximized_vert,maximized_horz
wmctrl -i -r "$WORKSPACE_ID"    -e 0,6000,398,2560,1600

