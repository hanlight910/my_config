#!/bin/bash

inode=$(wmctrl -l | grep -v BDHF | grep -v Firefox | grep -v workspace | grep -v sub | tail -n 1 | awk '{print $1}')

wmctrl -ia $inode
