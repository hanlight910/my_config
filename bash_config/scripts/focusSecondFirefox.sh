#!/bin/bash

wmctrl -l | grep -i YouTube | tail -n 1 | awk '{print $1}' | xargs -I {} wmctrl -ia {}
