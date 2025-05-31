#!/bin/bash

wmctrl -l | grep Firefox | tail -n 2 | head -n 1 | awk '{print $1}' | xargs -I {} wmctrl -ia {}
