stty -ixon

export TERM=rxvt-256color
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

#Some aliases
alias v="vim"
alias ka="killall"
alias sv="sudo vim"
alias r="ranger"
alias ls='ls -hN --color=auto --group-directories-first'
alias g="git"
alias gitup="git push origin master"
alias mkdir="mkdir -pv"
alias p="sudo pacman"
alias aur="pacaur"
alias sn="sudo shutdown now"
alias rst="sudo reboot"
alias starwars="telnet towel.blinkenlights.nl"
alias nf="clear && neofetch"
alias newnet="sudo systemctl restart NetworkManager"
alias tn="ping 8.8.8.8"

#Music
alias pause="mpc toggle"
alias next="mpc next"
alias prev="mpc prev"
alias trupause="mpc pause"
alias beg="mpc seek 0%"
alias lilbak="mpc seek -10"
alias lilfor="mpc seek +10"
alias bigbak="mpc seek -120"
alias bigfor="mpc seek +120"


#Check the weather:
weath() { curl wttr.in/$1 ;}

#Directory Shortcuts:
alias h="cd ~ && ls -a"
alias d="cd ~/Downloads && ls -a"
alias pics="cd ~/Pictures && ls -a"
alias m="cd ~/Music && ls -a"
alias s="cd ~/.scripts && ls -a"
alias c="cd ~/.config && ls -a"
alias C="cd ~/Code && ls -a"

alias i3conf="vim ~/.config/i3/config"
alias vimrc="vim ~/.vimrc"
alias rangerrc="vim ~/.config/ranger/rc.conf"
export EDITOR='vim'
export VISUAL='vim'
