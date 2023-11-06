#!/bin/bash

# makedir and cd into it
function mkcd {
	mkdir -p -- "$1" && cd -P -- "$1" 
}

# save/delete a shortcut
function shortcutSave {
	d=$(pwd)
	b=$(basename "$d")
	s="${1:-$b}"
	
	[ "$s" = '/' ] && return
	[ -f "$dirsfile" ] || touch "$dirsfile"
	grep -q "^$s=" "$dirsfile" && sed -i "/^$s=/d" "$dirsfile"
	printf '%s="%s"\n' "$s" "$d" >> "$dirsfile"
	declare -ng tmp="$s"
	tmp="$d"
}
function shortcutDelete {
	d=$(pwd)
	b=$(basename "$d")
	s="${1:-$b}"
	
	[ "$s" = '/' ] && return
	[ -f "$dirsfile" ] && sed -i "/^$s=/d" "$dirsfile"
	declare -ng tmp="$s"
	unset tmp
}

# Create a quick backup file
function backup {
	cp $1 $1.bak
}

function gc() {
    read -p "Enter your commit message: " message
    git commit -m "$message"
}