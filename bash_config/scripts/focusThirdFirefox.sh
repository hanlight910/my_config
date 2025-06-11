#!/bin/bash

wmctrl -l | grep -v -i YouTube | grep Firefox | tail -n 1 | awk '{print $1}' | xargs -I {} wmctrl -ia {}
