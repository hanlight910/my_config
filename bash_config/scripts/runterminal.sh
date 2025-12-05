#!/bin/bash

ghostty -e tmux new-session -A -s workspace &

sleep 2

# Launch terminal 2 with tmux session 'subspace'
ghostty -e tmux new-session -A -s subspace &
