export PATH="$HOME/.cargo/bin:$PATH"
# Environment Variables

# Golang Specific variables
if [[ -d "/usr/local/go" ]]; then
    export GOROOT="/usr/local/go"
fi

export PATH="$GOROOT/bin:$PATH"
export GOPATH=$HOME/Code/go
export GOBIN=$GOPATH/bin

# Rust Specific Variables
export CARGOBIN="$HOME/.cargo/bin"
export RUST_SRC_PATH="$($CARGOBIN/rustc --print sysroot)/lib/rustlib/src/rust/src"

# My custom variables
export HMBIN="$HOME/.bin"
export SCRIPTS_DIR="$HOME/.scripts"
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# Set $TERM
export TERM="xterm-256color"

export PATH="/usr/local/bin:$PATH:$HMBIN:$GOBIN:$CARGOBIN:$SCRIPTS_DIR"
export CODE_DIR="$HOME/Code"

# Fix for fork problems with Ansible on Mac OSX
# See: https://github.com/ansible/ansible/issues/32499
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export GPG_TTY=$(tty)

if [[ -f "$HOME/.env.bash" ]]; then
    source $HOME/.env.bash
fi

# Disable packer colored output
export PACKER_NO_COLOR="1"

if [[ -d ~/.cargo ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [[ "$(which fd)" == *"fd"* ]]; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
fi

if [[ -f ~/.profile ]]; then
    source ~/.profile
fi
