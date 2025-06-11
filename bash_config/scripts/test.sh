
#!/bin/bash

# context=$1
# time=$2
# month=$3
# day=$4
#
# gcalcli --calendar 'school class calender' quick "$context at $time on $month $day"

title="test"
when="+10m"
duration="1"
gcalcli add --default-calendar="school class calender" --noprompt --title "$title" --when "$when" --duration "$duration"
