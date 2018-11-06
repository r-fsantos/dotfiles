# Colors and Prompt
ORANGE=$(tput setaf 166)
RED=$(tput setaf 160)
VIOLET=$(tput setaf 61)
BLUE=$(tput setaf 33)
CYAN=$(tput setaf 37)
NO_COLOR="\e[0m"

# Git branch for prompt
function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "${ref#refs/heads/} "
}

# Lambda or Delta
function lambda_or_delta {
    dirty=$([[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*")
    if [[ $dirty == "*" ]]; then
        echo "Δ"
        return
    fi
    echo "λ"
}

function asterisk_if_dirty {
    [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

# Get the last command status
function last_command_status {
    if [[ $? == "0" ]]; then
        return
    fi

    echo "!! "
}

# If over remote display hostname
function remote_hostname {
    if [ -n "$SSH_CLIENT"  ] || [ -n "$SSH_TTY"  ]; then
        echo "@$HOSTNAME "
    fi
}

# Make the pwd look pretty
function pretty_pwd {
    dir=`pwd | awk -F\/ '{print $(NF-1),$(NF)}' | sed 's/ /\\//'`
    echo "$dir"
}

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1="\[$RED\]\$(last_command_status)\[$VIOLET\]\$(remote_hostname)\[$BLUE\]\$(pretty_pwd) \[$CYAN\]\$(parse_git_branch)\[$ORANGE\]\$(lambda_or_delta) \[$NO_COLOR\]"
# PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$(parse_git_branch)$ "
