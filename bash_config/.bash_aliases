#!/bin/bash

alias nv="nvim"
alias c="clear"
alias py="python3"

# command_argument
alias eb=". $HOME/.bashrc"
alias ev="source $BASH_CONFIG/scripts/activateEnv.sh"

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
alias xci="xclip -sel clip -t image/png -i"

alias wm="tmux new -s workspace"
alias ta="tmux attach"

alias cf="cd \"\$(find ./ -type d | fzf)\""
alias xf="fzf | xclip -sel clip"
alias of="open \"\$(fzf)\""
alias sf="realpath \"\$(fzf)\" | xclip -sel clip"
alias f="\"\`fzf\`\""
alias rf="rm -rf \"\`fzf\`\""

alias gcw="gcalcli calw"
alias gcm="$BASH_CONFIG/scripts/gcalmonth.sh"

alias gca="$BASH_CONFIG/scripts/gcalagenda.sh"
alias gcmo="$BASH_CONFIG/scripts/gcalmodify.sh"

alias nvi="nvim \$(fzf --preview=\"bat --color=always {}\")"
alias mf="mv \`fzf --preview=\"bat --color=always {}\"\`"

# Aider


aichat_f_copy() {
	aichat "$@" | xclip -sel clip
}

alias what="aichat_f_copy Short Answer: what "
alias how="aichat_f_copy -r %shell% Short Answer: How "
alias explain="aichat_f_copy -r %explain-shell%"
alias cli="aichat_f_copy -r %shell%"
alias codeai="aichat_f_copy -r %code% -c"
alias gen="codeai"

aichat_gf_copy() {
	# aichat --model gemini:gemini-2.5-pro-exp-03-25
	aichat --model gemini:gemini-2.0-flash "$@" | xclip -sel clip
}

alias gwhat="aichat_gf_copy Short Answer: what "
alias ghow="aichat_gf_copy -r %shell% Short Answer: How "
alias gdetermine="aichat_gf_copy With single sentence explanation: determine whether the following statement is true or false."
alias gexplain="aichat_gf_copy -r %explain-shell%"
alias gcli="aichat_gf_copy -r %shell%"
alias gcodeai="aichat_gf_copy -r %code% -c"
alias ggen="codeai"

alias susp="systemctl suspend"

alias scrkey="screenkey --font-size small --opacity 0.1 --position bottom --scr 3 -t 1"
alias tes="extractTextFromImage.sh"

alias fd="sudo fdisk"
alias fdl="sudo fdisk --list"

# unix command
alias mk="mkdir"
alias mkcd="mkdirCd.sh"
alias jf="journalctl -f"
alias rd="rm -rf ~/Downloads"
alias da="date"

# key binding
alias gsk="gsettings list-recursively | grep -i 'keybinding'"

# external package
alias kakao="wine \"/home/light/.wine/drive_c/Program Files (x86)/Kakao/KakaoTalk/KakaoTalk.exe\""
alias kn="kanata --cfg config_corne.kbd"
alias qr="qrencode -o myqr.png "
alias topdf="libreoffice --headless --convert-to pdf "
alias topy="jupyter nbconvert --to python "
alias ipy="ipython"

# ssh
alias shr="ssh -o IdentitiesOnly=yes -p $UBUNTU_SSH_PORT $UBUNTU_SSH_USER@$UBUNTU_SERVER_IP"
alias dm="ssh -t $NAME@$DMLABSERVER \"bash -i\""
alias dmfs="bash dmfs.sh"

# Scripts
alias fs="ls $SCRIPT_PATH | fzf --prompt='Select a script > ' --height=20 --reverse "

fzf-select-script() {
  local script
  script=$(ls "$SCRIPT_PATH" 2>/dev/null | fzf --prompt='Select a script > ' --height=20 --reverse)
  if [[ -n "$script" ]]; then
    READLINE_LINE="${READLINE_LINE:0:READLINE_POINT}${SCRIPT_PATH}/${script} ${READLINE_LINE:READLINE_POINT:}"
    READLINE_POINT=$(( READLINE_POINT + ${#SCRIPT_PATH} + ${#script} + 2 ))
  fi
}
fzf-select-path() {
  local script
  path=$(find "$ARCHIVE_PATH" 2>/dev/null | fzf --prompt='Select a script > ' --height=20 --reverse)
  if [[ -n "$path" ]]; then
	READLINE_LINE="${READLINE_LINE:0:READLINE_POINT}${path} ${READLINE_LINE:READLINE_POINT:}"
	READLINE_POINT=$(( READLINE_POINT + ${#path} + 1 ))
  fi
}
bind -x '"\es": "fzf-select-script"'

bind -x '"\ea": "fzf-select-path"'

alias dl="deleteAllExcept.sh"
