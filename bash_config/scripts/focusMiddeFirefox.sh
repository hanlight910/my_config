#!/bin/bash
wmctrl -l | grep Firefox | head -n 2 | tail -n 1 | awk '{print $1}' | xargs -I {} wmctrl -ia {}
