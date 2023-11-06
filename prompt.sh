#!/bin/bash

PS1="\n"						# new line
PS1="$PS1"'\[\e[38;5;41m\]'		# change to green
PS1="$PS1"'\u@\h '				# user@host[space]
PS1="$PS1"'\[\033[35m\]'		# change to purple

if [[ $MSYSTEM == "MINGW64" ]]; then
    PS1="$PS1"'MINGW64 '            # Print MINGW64
else
    PS1="$PS1"'WSL '                # Print WSL
fi

PS1="$PS1"'\[\e[38;5;69m\]'		# change to blue
PS1="$PS1"'\w'					# current working directory
if test -f "$HOME/.git-prompt.sh"
then
	source "$HOME/.git-completion.bash"
	source "$HOME/.git-prompt.sh"
	PS1="$PS1"'\[\033[36m\]'	# change color to cyan
	PS1="$PS1"'`__git_ps1`'		# bash function
fi
PS1="$PS1"'\[\033[0m\]'			# change color
PS1="$PS1"'\n'					# new line
PS1="$PS1"'$ '					# prompt: always '$'

# Default color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
