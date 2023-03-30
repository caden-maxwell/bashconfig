# ------------- Bash Configs from Git -------------

alias rm='rm -i'
alias cp="cp -i"
alias activate='source .venv/bin/activate'
alias glog="git log --all --graph"

function mkcd {
	mkdir -p -- "$1" && cd -P -- "$1" 
}


# Auto-start ssh-agent

env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env

# Shortcut Functions

shopt -s cdable_vars
dirsfile=~/.dirs
if [ -f "$dirsfile" ]; then
	source "$dirsfile"
fi
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

