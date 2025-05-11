#!/bin/bash 

# Given input number $1, get value at that line of $2
path=$(sed -n "$1p" ~/dotfiles/tmux/tmux_shortcuts)

tmux run-shell "~/.local/bin/scripts/tmux-project-manager.sh $path"
