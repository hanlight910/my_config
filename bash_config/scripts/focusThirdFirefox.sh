#!/bin/bash

wmctrl -l | grep -v -i YouTube | grep -v -i chzzk |  grep Firefox | tail -n 1 | awk '{print $1}' | xargs -I {} wmctrl -ia {}
