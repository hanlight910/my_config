#!/bin/bash

# command_argument
alias eb=". $HOME/.bashrc"
alias et="cp $CONFIG/tmux/.tmux.conf ~/.tmux.conf"
alias ek="cp $CONFIG/kanata/kanata.service ~/.config/systemd/user/"

alias gS="git status"
alias gC="git checkout"

alias nv="nvim"
alias tm="tmux new -s l"
alias d="cd $HOME/Downloads"
alias md="mv ~/Downloads/\$(ls ~/Downloads/ -t | head -n 1)" 
