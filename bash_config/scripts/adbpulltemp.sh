#!/bin/bash

adb pull "$(adb shell ls -t /sdcard/temp/ | head -n 1 | tr -d '\r' | xargs -I{} echo /sdcard/temp/{})" .


