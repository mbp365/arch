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

#Some aliases
alias v="vim"
alias ka="killall"
alias sv="sudo vim"
alias r="ranger"
alias ls='ls -hN --color=auto --group-directories-first'
alias gitup="git push origin master"
alias mkdir="mkdir -pv"
alias p="sudo pacman"
alias aur="pacaur"
alias sn="sudo shutdown now"
alias rst="sudo reboot"
alias lock="i3lock-fancy"
alias suspend="i3lock-fancy && systemctl suspend"
alias starwars="telnet towel.blinkenlights.nl"
alias nf="clear && neofetch"
alias newnet="sudo systemctl restart NetworkManager"
alias testnet="curl -I http://google.com/"
alias mounted="mount | column -t"
alias gsd="sudo ~/.scripts/get-shit-done/get-shit-done.sh"
alias pastepic="xclip -selection clipboard -t image/png -o > pic.png"
alias copy="xclip -selection clipboard"
alias turnoffmonitor="xrandr --output eDP-1 --off"
alias hidegit="mv .git .git_"
alias unhidegit="mv .git_ .git"

#Mounting
alias mountusb="~/.scripts/mount_usb.sh"
alias unmountusb="~/.scripts/unmount_usb.sh"
alias mountphone="~/.scripts/mount_phone.sh"
alias unmountphone="~/.scripts/unmount_phone.sh"
alias mountprivate="~/.scripts/activate_private.sh"
alias unmountprivate="~/.scripts/unmount_private.sh"

#Synchronised history
export HISTFILE="/home/max/.config/bash/.bash_history"
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#Check the weather:
weath() { curl wttr.in/$1 ;}

#Directory Shortcuts:
alias Gh="cd ~ && ls -a"
alias Gd="cd ~/downloads && ls -a"
alias Gp="cd ~/pictures && ls -a"
alias Gm="cd ~/music && ls -a"
alias Gs="cd ~/.scripts && ls -a"
alias Gc="cd ~/.config && ls -a"
alias GC="cd ~/code && ls -a"
alias Gr="cd / && ls -a"

#Git Shortcuts:
alias gs="git status"
alias gsu="git status -uno"
alias gchk="git checkout"
alias gpull="git pull"
alias gpush="git push"
alias gf="git fetch"
alias gl="git log --pretty=short"
alias gcm="git commit"
alias gr="git rebase"
alias gm="git merge"
alias grm="git rm"
alias ga="git add"
alias gb="git branch"
alias gd="git diff"
alias gstash="git stash"
alias gitdeletebranch="git push origin --delete"
alias gitdeletelocalbranches="git fetch -p && for branch in \`git branch -vv | grep \': gone]\' | awk \'{print $1}\'\`; do git branch -D $branch; done"

#Git branch bash completion
source ~/.scripts/git-prompt.sh
if [ -f ~/.scripts/git-completion.bash ]; then
    . ~/.scripts/git-completion.bash
    # Add git completion to aliases
    __git_complete gchk _git_checkout
    __git_complete gpull _git_pull
    __git_complete gpush _git_push
    __git_complete gf _git_fetch
    __git_complete gl _git_log
    __git_complete gcm _git_commit
    __git_complete gr _git_rebase
    __git_complete gm _git_merge
    __git_complete grm _git_rm
    __git_complete ga _git_add
    __git_complete gb _git_branch
    __git_complete gd _git_diff
    __git_complete gstash _git_stash
    __git_complete gitdeletebranch _git_branch
fi

#python venv
export VIRTUAL_ENV_DISABLE_PROMPT=1
alias a="source ./.venv/bin/activate"
alias da="deactivate"

function getVenvName(){
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo " (venv)"
    fi
}

#rc files
alias i3rc="vim ~/.config/i3/config"
alias vrc="vim ~/.vimrc"
alias rrc="vim ~/.config/ranger/rc.conf"
alias rtrc="vim ~/.rtorrent.rc"
alias brc="vim ~/.bashrc"
alias xrc="vim ~/.Xdefaults"
alias nrc="vim ~/.newsboat/urls"
alias mrc="vim ~/.config/mpv/mpv.conf"

#PS1
export PS1='\[$bold\]\[$col2\]\u \[$col6\]\w\[$col5\]$(__git_ps1 " (%s)")\[$col4\]$(getVenvName) \[$col3\]> \[$reset\]'

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }
