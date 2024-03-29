#!/bin/bash

# ask first!
alias rm='rm -i'
alias cp="cp -i"

# git
alias gl="git log --all --graph"
alias ga="git add"
alias gs="git status"
alias gp="git push"
alias gpl="git pull"

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# python venv
if [[ $MSYSTEM == "MINGW64" ]]; then
	alias activate='. .venv/Scripts/activate'
else
	alias activate='source .venv/bin/activate'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
