alias v="vim"
alias sv="sudo vim"
alias ka="killall"
alias r="ranger"
alias ls='ls -hN --color=auto --group-directories-first'
alias mkdir="mkdir -pv"
alias p="sudo pacman"
alias aur="pacaur"
alias lock="i3lock-fancy"
alias starwars="telnet towel.blinkenlights.nl"
alias nf="clear && neofetch"
alias gsd="sudo ~/.scripts/get-shit-done/get-shit-done.sh"
alias turnoffmonitor="xrandr --output eDP-1 --off"
alias h="history"

#pasting
alias pastepic="xclip -selection clipboard -t image/png -o > pic.png"
alias copy="xclip -selection clipboard"

#internet
alias newnet="sudo systemctl restart NetworkManager"
alias testnet="curl -I http://google.com/"

#hardware control
alias sn="sudo shutdown now"
alias rst="sudo reboot"
alias suspend="i3lock-fancy && systemctl suspend"

#Mounting
alias mounted="mount | column -t"
alias mountusb="~/.scripts/mount_usb.sh"
alias unmountusb="~/.scripts/unmount_usb.sh"
alias mountphone="~/.scripts/mount_phone.sh"
alias unmountphone="~/.scripts/unmount_phone.sh"
alias mountprivate="~/.scripts/activate_private.sh"
alias unmountprivate="~/.scripts/unmount_private.sh"

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
alias gcherry="git cherry-pick"
alias gitdeletebranch="git push origin --delete"
alias gitdeletelocalbranches="git fetch -p && for branch in \`git branch -vv | grep \': gone]\' | awk \'{print $1}\'\`; do git branch -D $branch; done"
alias hidegit="mv .git .git_"
alias unhidegit="mv .git_ .git"

#python venv
alias a="source ./.venv/bin/activate"
alias da="deactivate"

#rc files
alias i3rc="vim ~/.config/i3/config"
alias vrc="vim ~/.vimrc"
alias rrc="vim ~/.config/ranger/rc.conf"
alias rtrc="vim ~/.rtorrent.rc"
alias brc="vim ~/.bashrc"
alias xrc="vim ~/.Xdefaults"
alias nrc="vim ~/.newsboat/urls"
alias mrc="vim ~/.config/mpv/mpv.conf"
