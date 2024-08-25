setopt extended_glob null_glob

path=(
  $path
  $HOME/bin
  $HOME/.local/bin 
  $HOME/.yarn/bin 
  $HOME/Downloads/nvim-linux64/bin 
  $HOME/Downloads/clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04/bin
  /bin
)

typeset -U path
path=($^path(N-/))

export PATH


export ZSH="$HOME/.oh-my-zsh/"

ZSH_THEME="robbyrussell"

KEY_TIMEOUT=1
# Vim keybindings
bindkey -v

plugins+=(vi-mode)

source $ZSH/oh-my-zsh.sh 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

tmux new -A -s primary
