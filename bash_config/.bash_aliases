#!/bin/bash

# convention
# command_argument
HOME_PATH="/home/light"
MY_CONFIG="$HOME/.my_config"
INSTALL="$MY_CONFIG/bash_config/install"
BASH_CONFIG_PATH="/home/light/.my_config/bash_config"
FUNCTIONS_PATH="/home/light/.bash_config/functions"
ASSISTS_PATH="/home/light/.bash_config/functions/assists"
COMPILE_PATH="/home/light/.bash_config/functions/compile"
WALLPAPER_PATH="/home/light/.bash_config/source/pictures/wallpapers"
TIL_DAILY_PATH="/home/light/coding/TIL/daily"
ARCHIVE_PATH="/home/light/archive"
ENGLISH_PATH="/home/light/archive/english"
LINUX_PATH="/home/light/archive/linux"

PY_PATH="/home/light/coding/languages/py"
C_PATH="/home/light/coding/languages/c"

alias lA="cat $BASH_CONFIG_PATH/.bash_aliases"

alias vv="nvim $BASH_CONFIG_PATH/.bash_variables"
alias nvA="nvim $BASH_CONFIG_PATH/.bash_aliases"
alias nva="nvim $ARCHIVE_PATH"

alias cb="cd $BASH_CONFIG_PATH"
alias cf="cd $BASH_CONFIG_PATH/functions"
alias cW="cd $WALLPAPER_PATH"

alias d="cd $HOME_PATH/Downloads"
alias py="cd $PY_PATH"
alias c="cd $C_PATH"
alias cP="cd $C_PATH/projects"
alias cpP="cd $PY_PATH/projects"
alias ctd="cd $TIL_DAILY_PATH"
alias cA="cd $ARCHIVE_PATH"
alias cE="cd $ENGLISH_PATH"
alias cL="cd $LINUX_PATH"

alias eb=". $HOME_PATH/.bashrc"
alias mkcd=". $ASSISTS_PATH/mkcd"
alias et="cp $MY_CONFIG/tmux/.tmux.conf ~/.tmux.conf"

alias gS="git status"
alias gC="git checkout"

alias nv="nvim"
alias alsa="alsamixer"

alias boj="xdg-open https://www.acmicpc.net/step"
alias imgMove="mv ~/Screenshots/\"$(ls ~/Screenshots -t | head -n 1)\""

alias tm="tmux new -s l"
