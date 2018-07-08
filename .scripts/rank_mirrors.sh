#backup old mirrors
cp -f /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo reflector --score 5 -p https --save /etc/pacman.d/mirrorlist
