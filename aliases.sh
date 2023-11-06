#!/bin/bash

# ask first!
alias rm='rm -i'
alias cp="cp -i"

# git
alias glog="git log --all --graph"
alias ga="git add ."
alias gs="git status"

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# python venv
alias activate='source .venv/bin/activate'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
