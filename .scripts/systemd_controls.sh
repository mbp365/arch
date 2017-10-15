#add this line to visudo
#-usr- ALL=(root) NOPASSWD: /home/-usr-/.scripts/systemd_controls.sh
/bin/systemctl $1
