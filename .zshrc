# ------------------ Configure P11K ------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------ Path Configuration ------------------


setopt extended_glob null_glob

# CUDA
export CUDA_HOME=/usr/local/cuda

path=(
  $path
  $HOME/bin
  $HOME/.bun/bin
  $HOME/.local/bin 
  $HOME/.yarn/bin 
  $HOME/Downloads/nvim-linux64/bin 
  $HOME/Downloads/clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04/bin
  $HOME/.npm-global/bin:$PATH
  /opt/nvim-linux64/bin
  $HOME/.cargo/bin
  /bin
)

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64

typeset -U path
path=($^path(N-/))

export PATH 
export PATH=$PATH:$CUDA_HOME/bin

# ------------------ Env Variables ------------------

# export ZSH="$HOME/.oh-my-zsh/"

KEY_TIMEOUT=0

# ------------------ History ------------------

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ------------------ Aliases ------------------
alias scripts='cd $SCRIPTS'
alias dot='cd $HOME/dotfiles'


# ls color 
alias ls='ls --color=auto'
alias la='ls -lathr'

# ------------------ Theme Settings ------------------
ZSH_THEME="powerlevel10k/powerlevel10k"

bindkey -v

# ------------------ Plugins ------------------
# plugins+=(vi-mode)

# ------------------ Sourcing ------------------
# source $ZSH/oh-my-zsh.sh 

# Fuzzy finding
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh 


# ------------------ P10K ------------------
# P10K
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ------------------ Vim Configuration ------------------

# Edit line in vim buffer
autoload edit-command-line; zle -N edit-command-line 
bindkey '^e' edit-command-line

# ------------------ TMUX Configuration ------------------

# Automatically start a new tmux session when starting zsh
# tmux new -A -s primary


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/home/ryder/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
source ~/powerlevel10k/powerlevel10k.zsh-theme

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh --disable-up-arrow)"
