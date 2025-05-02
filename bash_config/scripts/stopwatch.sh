#!/bin/bash

export LC_NUMERIC="POSIX"

arg="$1"
if [ "$arg" = '-h' ] || [ "$arg" = '--help' ]; then
    echo "Usage:"
    echo "  <space> = Finish round"
    echo "  <enter> = Finalize"
    exit 0
fi

CSV_FILE="$HOME/archive/03-RESOURCES/stopwatch_results.csv"  # <== File to store the results

reset_line() {
    printf '\33[2K\r'
}

get_time() {
    date +'%s.%N'
}

get_time_diff() {
    start="$1"
    end="$2"
    nanoDigits="$3"
    seconds="$( echo "${end} ${start}" | awk '{printf "%f", $1 - $2}' )"
    date -d@"${seconds}" -u +"%H:%M:%S.%${nanoDigits}N"
}

normalFormat="$( echo -e '\e[0m' )"
nthFormat="$( echo -e '\e[31;1m' )"
currentFormat="$( echo -e '\e[1m' )"
finalFormat="$( echo -e '\e[32;1m' )"
elapsedFormat="$( echo -e '\e[35;1m' )"
roundFormat="$( echo -e '\e[36;1m' )"

start="$( get_time )"
last="${start}"
round='1'

while true; do
    c=''
    if IFS='' read -s -n1 -t 0.095 rc; then
        if [ -n "${rc}" ]; then
            c="${rc}"
        else
            c='*'
        fi
    fi
    time="$( get_time )"
    if [[ "${c}" == ' ' || ( "${c}" == '*' && "${last}" != "${start}" ) ]]; then
        reset_line
        echo -n "Round ${nthFormat}$( printf '%2s' "${round}" )${normalFormat}, finished at: "
        echo -n "${elapsedFormat}$( get_time_diff "${start}" "${time}" 3 )${normalFormat}"
        echo -n ' | round time: '
        echo -n "${roundFormat}$( get_time_diff "${last}" "${time}" 3 )${normalFormat}"
        echo ''
        round="$( expr "${round}" + 1 )"
        last="${time}"
    elif [ "$c" = '*' ]; then
        reset_line
        finalElapsed="$( get_time_diff "${start}" "${time}" 3 )"
        echo "Elapsed time: ${finalFormat}${finalElapsed}${normalFormat}"

        # Ask for name
        echo -n "Enter a name for this stopwatch session: "
        read session_name

        # Append to CSV
        echo "\"${session_name}\",\"${finalElapsed}\"" >> "$CSV_FILE"

        echo "Saved to ${CSV_FILE}."
        exit 0
    fi
    reset_line
    echo -n "Time: ${currentFormat}$( get_time_diff "${start}" "${time}" 1 )${normalFormat}"
done

