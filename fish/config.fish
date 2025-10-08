set -U fish_greeting 

if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish --disable-up-arrow | source
end

# ------------------ Path Configuration ------------------

# Set CUDA Home
set -x CUDA_HOME /usr/local/cuda

# Add directories to the PATH
# fish_add_path handles duplicates and is the idiomatic way to add to the path.
fish_add_path $HOME/bin
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.yarn/bin
fish_add_path $HOME/Downloads/nvim-linux64/bin
fish_add_path $HOME/Downloads/clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04/bin
fish_add_path /opt/nvim-linux64/bin
fish_add_path /bin
fish_add_path $CUDA_HOME/bin
fish_add_path ~/go/bin
fish_add_path ~/.npm-global/bin

# Set LD_LIBRARY_PATH
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64

# ------------------ NVM Configuration ------------------

set -x NVM_DIR "$HOME/.nvm"
# The standard nvm.sh script is not compatible with Fish.
# It is recommended to use a Fish-compatible version, often installed via a plugin manager.
# For example, using Fisher: fisher install jorgebucaran/nvm.fish
# Once installed, you can simply call nvm functions.

# ------------------ PNPM Configuration ------------------

set -x PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path $PNPM_HOME

# zoxide initialization 
zoxide init fish | source
