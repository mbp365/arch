stty -ixon

#vi mode
set -o vi

PATH="$PATH:/home/max/.gem/ruby/2.5.0/bin"

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

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export TERM=rxvt-256color
export PS1="\[$bold\]\\[$col2\]\u \[$col6\]\w$(parse_git_branch) \[$col4\]> \[$reset\]"

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

#Mounting
alias mountusb="~/.scripts/mount_usb.sh"
alias unmountusb="~/.scripts/unmount_usb.sh"
alias mountphone="~/.scripts/mount_phone.sh"
alias unmountphone="~/.scripts/unmount_phone.sh"
alias mountprivate="~/.scripts/activate_private.sh"
alias unmountprivate="~/.scripts/unmount_private.sh"

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
alias gch="git checkout"
alias gp="git pull"
alias gf="git fetch"
alias gl="git log"
alias gc="git commit"
alias gr="git rebase"
alias gm="git merge"
alias grm="git rm"
alias ga="git add"

#rc files
alias i3rc="vim ~/.config/i3/config"
alias vrc="vim ~/.vimrc"
alias rrc="vim ~/.config/ranger/rc.conf"
alias rtrc="vim ~/.rtorrent.rc"
alias brc="vim ~/.bashrc"
alias xrc="vim ~/.Xdefaults"
alias nrc="vim ~/.newsboat/urls"
alias mrc="vim ~/.config/mpv/mpv.conf"

export EDITOR='vim'
export VISUAL='vim'
alias addkey="gpg --recv-keys"

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }
