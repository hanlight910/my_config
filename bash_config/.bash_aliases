#!/bin/bash

alias nv="nvim"
alias c="clear"
# command_argument
alias eb=". $HOME/.bashrc"
alias ev=". ./venv/bin/activate"

alias ct="cp $CONFIG/tmux/.tmux.conf ~/.tmux.conf"
alias ek="cp $CONFIG/kanata/kanata.service ~/.config/systemd/user/"
alias cg="cp $CONFIG/ghostty/config $XDG_CONFIG_HOME/ghostty/config"

alias ld="ls ~/Downloads"

alias gS="git status"
alias gC="git checkout"

alias tm="tmux new -s sub"
alias d="cd $HOME/Downloads"
alias md="mv ~/Downloads/\"\$(ls ~/Downloads/ -t | head -n 1)\"" 

alias olrd="ollama run deepseek-r1:7b"
alias olrl="ollama run llama3.2:latest"
alias row="docker run open-webui"

alias xc="xclip -sel clip"

alias nvi="nvim \$(fzf --preview=\"bat --color=always {}\")"
alias wm="tmux new -s workspace"
alias cf="cd \$(find ./ -type d | fzf)"
alias rd="rm ~/Downloads/*"

alias gcw="gcalcli calw"
alias gca="gcalcli agenda"
