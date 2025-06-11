#!/bin/bash

wmctrl -l | grep -i -v YouTube | grep -i firefox | head -n 1 | awk '{print $1}' | xargs -I {} wmctrl -ia {}

