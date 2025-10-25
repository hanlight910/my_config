#!/bin/bash

NAME_WINDOW="workspace"
wmctrl -l | grep "$NAME_WINDOW" | tail -n 1 | awk '{print $1}' | xargs -I {} wmctrl -ia {}
