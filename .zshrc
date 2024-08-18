# export PATH="$PATH:$HOME/bin:$HOME:$HOME/Downloads/Downloads/nvim-linux64/bin:$HOME/.local/bin:/usr/local/bin"
export ZSH="$HOME/.oh-my-zsh/"

ZSH_THEME="robbyrussell"

KEY_TIMEOUT=1
# Vim keybindings
bindkey -v

plugins+=(vi-mode)

source $ZSH/oh-my-zsh.sh 
alias tmux="TERM=screen-256color-bce tmux"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

tmux new -A -s primary

notes () {
  nvim ~/notes.md
}

export PATH="$HOME/.yarn/bin:$HOME/.local/bin:~/Downloads/nvim-linux64/bin:$PATH"
