#!/bin/bash

xclip -sel clip -t image/png -i "$(xclip -sel clip -o)"
