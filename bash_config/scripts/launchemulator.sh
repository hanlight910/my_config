#!/bin/bash
flutter emulators --launch test
xdotool search --name "Android Emulator" windowmove %@ 3800 0
managewindow.sh &
