# -*- mode: sh -*-
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# # of commands to save in history file
HISTSIZE=1000
# # of lines to save in history file
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Recursive globs
shopt -s globstar

# Make old terminals work better
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
[ -x /usr/bin/dircolors ] && eval "alias ls='ls --color'"

# Add fzf functionality
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Load "Extra Stuff" that I don't want to put in Git for various reasons.
if [[ -f ~/.bash_extras ]]; then
    source ~/.bash_extras
fi

# Source my "sub bashrc" scripts
if [[ -d ~/.bash ]]; then
  for f in ~/.bash/*; do
    source $f
  done
fi

if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
    source /usr/local/bin/virtualenvwrapper.sh
fi

export PATH="/usr/local/bin:/usr/local/opt/texinfo/bin:/usr/local/opt/coreutils/libexec/gnubin:$HOME/.scripts:$PATH"
