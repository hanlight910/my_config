#!/bin/bash
source "$HOME/.my_config/bash_config/.env"
echo "$SITE1" > ~/.my_config/bash_config/scripts/log
xdg-open "$SITE1"
