stty -ixon

export TERM=rxvt-256color
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

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
alias starwars="telnet towel.blinkenlights.nl"
alias nf="clear && neofetch"
alias newnet="sudo systemctl restart NetworkManager"
alias testnet="ping 8.8.8.8"
alias mountphone="~/.scripts/mount_phone.sh"
alias unmountphone="~/.scripts/unmount_phone.sh"

#Check the weather:
weath() { curl wttr.in/$1 ;}

#Directory Shortcuts:
alias gh="cd ~ && ls -a"
alias gd="cd ~/downloads && ls -a"
alias gp="cd ~/pictures && ls -a"
alias gm="cd ~/music && ls -a"
alias gs="cd ~/.scripts && ls -a"
alias gc="cd ~/.config && ls -a"
alias gC="cd ~/code && ls -a"
alias gr="cd / && ls -a"

#rc files
alias i3rc="vim ~/.config/i3/config"
alias vrc="vim ~/.vimrc"
alias rrc="vim ~/.config/ranger/rc.conf"
alias rtrc="vim ~/.rtorrent.rc"
alias brc="vim ~/.bashrc"
alias xrc="vim ~/.Xdefaults"

export EDITOR='vim'
export VISUAL='vim'
alias pastepic="xclip -selection clipboard -t image/png -o > pic.png"
