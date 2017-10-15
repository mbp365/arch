sudo mv pacman.conf /etc/pacman.conf
sudo pacman -S $(<pacman_dependencies.txt) --needed --noconfirm
yaourt -S $(<yaourt_dependencies.txt) --needed --noconfirm
mv -rv .config/i3/config ~/.config/i3/config
mv -rv .scripts/ ~/
systemctl enable slim.service
sudo mv -v slim-minimal/ /usr/share/slim/themes/
sudo mv -v slim.conf /etc/slim.conf
sudo mv -v clipboard /etc/lib/urxvt/perl/
