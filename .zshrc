# ------------------ Path Configuration ------------------


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

# ------------------ Env Variables ------------------

export ZSH="$HOME/.oh-my-zsh/"

KEY_TIMEOUT=1

# ------------------ History ------------------

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ------------------ Aliases ------------------
alias scripts='cd $SCRIPTS'
alias dot='cd $HOME/ConfigCode/dotfiles'


# ls color 
alias ls='ls --color=auto'
alias la='ls -lathr'

# ------------------ Sourcing ------------------
source $ZSH/oh-my-zsh.sh 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ------------------ Theme Settings ------------------
ZSH_THEME="robbyrussell"

bindkey -v

# ------------------ Plugins ------------------
plugins+=(vi-mode)


# ------------------ TMUX Configuration ------------------

# Automatically start a new tmux session when starting zsh
# tmux new -A -s primary
