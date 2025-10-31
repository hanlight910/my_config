#!/bin/bash

sshfs "$DMSSH:/home/$NAME" $REMOTE_PATH 
nvim $REMOTE_PATH
