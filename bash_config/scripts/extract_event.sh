#!/bin/bash

input_file="schedule.txt"
current_date=$(date "+%a %b %d")
current_time=$(date "+%I:%M%p" | sed 's/^0*//')

# Remove ANSI colors
strip_colors() {
  sed 's/\x1b\[[0-9;]*m//g'
}

# Convert AM/PM time to epoch seconds
time_to_sec() {
  date -d "$1" +%s
}

now_sec=$(date +%s)
found_date=""
found_event=""

input=$(gcalcli agenda)
while IFS= read -r line; do
    clean_line=$(echo "$line" | strip_colors)

    # Check for date and time in same line
    if [[ $clean_line =~ ^([A-Z][a-z]{2}\ [A-Z][a-z]{2}\ [0-9]{1,2})[[:space:]]+([0-9]{1,2}:[0-9]{2}(am|pm))[[:space:]]+(.*)$ ]]; then
        line_date="${BASH_REMATCH[1]}"
        line_time="${BASH_REMATCH[2]}"
        line_event="${BASH_REMATCH[4]}"
        line_datetime_sec=$(time_to_sec "$line_date $line_time")

		found_date=$line_date
        if (( line_datetime_sec > now_sec )); then
            found_event="$line_date $line_time $line_event"
            break
        fi
    fi

    # If time + event line, under existing date
    if [[ $clean_line =~ ^[[:space:]]*([0-9]{1,2}:[0-9]{2}(am|pm))[[:space:]]+(.*)$ ]]; then
        [[ -z $found_date ]] && continue
        line_time="${BASH_REMATCH[1]}"
        line_event="${BASH_REMATCH[3]}"
        line_datetime_sec=$(time_to_sec "$found_date $line_time")

        if (( line_datetime_sec > now_sec )); then
            found_event="$found_date $line_time $line_event"
            break
        fi
    fi
done <<< $input

echo "$found_event"
