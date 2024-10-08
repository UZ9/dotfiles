#!/bin/zsh 

# Adapted from Primeagen's tmux sessionizer script

if [[ $# -eq 1 ]]; then
  selected=$1
else 
  selected=$(find ~/Code -mindepth 1 -maxdepth 1 -type d | fzf)
fi 

if [[ -z $selected ]]; then 
  exit 0
fi 

selected_name=$(basename "$selected" | tr . _)

echo $selected_name

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then 
  tmux new-session -s $selected_name -c $selected 
  exit 0
fi 

echo $selected_name
if ! tmux has-session -t=$selected_name 2> /dev/null; then
  tmux new-session -ds $selected_name -c $selected
fi 

tmux switch-client -t $selected_name
