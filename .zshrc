# export PATH="$PATH:$HOME/bin:$HOME:$HOME/Downloads/Downloads/nvim-linux64/bin:$HOME/.local/bin:/usr/local/bin"
export ZSH="$HOME/.oh-my-zsh/"

ZSH_THEME="robbyrussell"

# Commented out as installation currently depends on distro, want to make an automated installation instead
# plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh 
# source "$HOME/.bashrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

tmux new -A -s primary

export PATH="$HOME/.local/bin:~/Downloads/nvim-linux64/bin:$PATH"
