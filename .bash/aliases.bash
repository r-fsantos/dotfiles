# Quality of Life
alias nv="nvim"
alias n="nvim"
alias vgt="vagrant"
alias emt="emacs -nw"
alias e="$EDITOR"

alias et="emacsclient --tty --socket-name=terminal"
alias ec="emacsclient --create-frame --no-wait"

function dotfiles() {
    cd $(dfm where)
}

if [[ -x /usr/local/bin/nvim ]]; then
    alias vi="nvim"
    alias vim="nvim"
fi

# ls aliases
alias ll="ls -alF"
alias la="ls -a"
alias l="ls -CF"

# GNU ls needs some special help
# if [[ -x /bin/dircolors ]]; then
#     alias ls="ls --color"
#     alias ll="ls --color -alF"
#     alias la="ls --color -a"
#     alias l="ls --color -CF"
# fi

# cd aliases
alias cd..="cd .."
alias cdc="cd $HOME/Code"
alias cdn="cd $HOME/Notes"

# Common package manager stuff
alias apt="sudo apt"
alias zyp="sudo zypper"
alias dnf="sudo dnf"
alias pca="pacaur"
alias pac="sudo pacman"
alias pacman="sudo pacman"

# Programming language stuff
alias p="python"
alias p3="python3"
alias ve="python3 -m venv"
alias venv="python3 -m venv"

# Systemctl is used too much to sudo that shit.
alias systemctl="sudo systemctl"
alias sctl="sudo systemctl"
alias pg="sudo systemctl start postgresql"

# Git
alias g="git"
alias gc="git commit -v"
alias ga="git add"
alias gb="git branch"
alias gp="git push"
alias gpl="git pull"
alias gck="git checkout"
alias gcp="git cherry-pick"
alias gst="git status"

# Ctags
alias ct="ctags ."

# Amazon Web Services (aws)
alias ec2="aws ec2"
alias s3="aws s3"
alias tf="terraform"

# FZF
function fcd() {
    cmd=$(__fzf_cd__)
    $cmd
}

if [[ $(uname) == "Darwin" ]]; then
    export CLICOLOR=1
fi
