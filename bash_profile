export PATH="$HOME/.cargo/bin:$PATH"
# Environment Variables

# Golang Specific variables
if [[ -d "/usr/local/go" ]]; then
    export GOROOT="/usr/local/go"
else
    export GOROOT=$(go env | grep GOROOT | sed s/GOROOT=// | sed 's/"//g')
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
export EDITOR="emacsclient --tty --socket-name=terminal"


# # If not in tmux set $TERM
# if [[ $TERM != *screen* ]]; then
#     export TERM="xterm"
# fi

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

if [[ -d /usr/share/terminfo ]]; then
    export TERMINFO='/usr/share/terminfo'
fi

if [[ -d ~/.cargo ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ "$(which fd)" == *"fd"* ]]; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
fi

source ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
