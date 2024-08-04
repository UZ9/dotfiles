# export PATH="$PATH:$HOME/bin:$HOME:$HOME/Downloads/Downloads/nvim-linux64/bin:$HOME/.local/bin:/usr/local/bin"
export ZSH="$HOME/.oh-my-zsh/"

ZSH_THEME="robbyrussell"

KEY_TIMEOUT=1
# Vim keybindings
bindkey -v

plugins+=(vi-mode)

source $ZSH/oh-my-zsh.sh 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

tmux new -A -s primary

export PATH="$HOME/.yarn/bin:$HOME/.local/bin:~/Downloads/nvim-linux64/bin:$PATH"
