#!/bin/shell
TODAY=$(date "+%Y%m%d");
FILES=$(adb shell "ls -l /sdcard/DCIM/Camera | grep '$TODAY' | awk '{print \$NF}'")

for FILE in $FILES; do
    adb pull "/sdcard/DCIM/Camera/$FILE"
done


