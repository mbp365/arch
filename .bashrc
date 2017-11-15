stty -ixon

export TERM=rxvt-256color
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

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
alias lock="i3lock-fancy"
alias starwars="telnet towel.blinkenlights.nl"
alias nf="clear && neofetch"
alias newnet="sudo systemctl restart NetworkManager"
alias testnet="ping 8.8.8.8"

#Check the weather:
weath() { curl wttr.in/$1 ;}

#Directory Shortcuts:
alias h="cd ~ && ls -a"
alias d="cd ~/downloads && ls -a"
alias pics="cd ~/pictures && ls -a"
alias m="cd ~/music && ls -a"
alias s="cd ~/.scripts && ls -a"
alias c="cd ~/.config && ls -a"
alias C="cd ~/code && ls -a"

alias i3conf="vim ~/.config/i3/config"
alias vimrc="vim ~/.vimrc"
alias rangerrc="vim ~/.config/ranger/rc.conf"
export EDITOR='vim'
export VISUAL='vim'
alias pastepic="xclip -selection clipboard -t image/png -o > pic.png"
