
# Neccessary libraries
sudo apt-get install libevent-dev ncurses-dev build-essential bison pkg-config -y

sudo apt install tmux -y

cp $HOME/.my_config/tmux/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux source-file ~/.tmux.conf
