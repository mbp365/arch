export PATH=$PATH:~/.local/bin

#load aliases
source ~/.config/bash/bash_aliases.sh

alias tngvpn="sudo openvpn --daemon --config /home/max/downloads/tng_vpn/TNG_VPN/tng_vpn.ovpn"
stty -ixon

#vi mode
set -o vi

# color names for readibility
reset=$(tput sgr0)
bold=$(tput bold)
back=$(tput setaf 0)
col1=$(tput setaf 1)
col2=$(tput setaf 2)
col3=$(tput setaf 3)
col4=$(tput setaf 4)
col5=$(tput setaf 5)
col6=$(tput setaf 6)

export TERM=rxvt-256color
export EDITOR='vim'
export VISUAL='vim'

#Synchronised history
export HISTFILE="/home/max/.config/bash/.bash_history"
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

#Check the weather:
weath() { curl wttr.in/$1 ;}

#Git branch bash completion
source ~/.scripts/git-prompt.sh
if [ -f ~/.scripts/git-completion.bash ]; then
    . ~/.scripts/git-completion.bash
    # Add git completion to aliases
    __git_complete gchk _git_checkout
    __git_complete gchkh _git_checkout
    __git_complete gs _git_status
    __git_complete gpull _git_pull
    __git_complete gpush _git_push
    __git_complete gf _git_fetch
    __git_complete gfap _git_fetch
    __git_complete gl _git_log
    __git_complete gcm _git_commit
    __git_complete gcma _git_commit
    __git_complete grebase _git_rebase
    __git_complete grevert _git_revert
    __git_complete greset _git_reset
    __git_complete gm _git_merge
    __git_complete grm _git_rm
    __git_complete ga _git_add
    __git_complete gb _git_branch
    __git_complete gd _git_diff
    __git_complete gstash _git_stash
    __git_complete gdremotebranch _git_branch
fi

#python venv
export VIRTUAL_ENV_DISABLE_PROMPT=1

function getVenvName(){
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo " (venv)"
    fi
}

#PS1
export PS1='\[$bold\]\[$col2\]\u \[$col6\]\w\[$col5\]$(__git_ps1 " (%s)")\[$col4\]$(getVenvName) \[$col3\]> \[$reset\]'

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}
