#!/bin/bash

sshfs "$HOMENAME@$HOMESERVER:/home/$HOMENAME/projects/" $REMOTE1_PATH \
  -o port="$HOME_PORT" \

nvim $REMOTE1_PATH
