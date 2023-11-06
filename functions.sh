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

# Useful shortcuts for when I forget
shortcuts() {
cat <<-:
Shortcut | Action
---------|-----------------------------------------------
  Up     | Bring up older commands from history
  Down   | Bring up newer commands from history
  Left   | Move cursor BACKWARD one character
  Right  | Move cursor FORWARD one character
Backspace| Erase the character to the LEFT of the cursor
  Delete | Erase the character to the RIGHT the cursor
  ^A     | Move cursor to BEGINNING of line
  ^E     | Move cursor to END of line
  M-B    | Move cursor BACKWARD one whole word
  M-F    | Move cursor FORWARD one whole word
  ^C     | Cancel (terminate) the currently running process
  TAB    | Complete the command or filename at cursor
  ^W     | Cut BACKWARD from cursor to beginning of word
  ^K     | Cut FORWARD from cursor to end of line (kill)
  ^Y     | Yank (paste) text to the RIGHT the cursor
  ^L     | Clear the screen while preserving command line
  ^U     | Cut the entire command line
:
}
