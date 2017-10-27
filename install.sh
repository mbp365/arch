#sudo cp pacman.conf /etc/pacman.conf
sudo pacman -Syu
sudo pacman -S $(<pacman_dependencies.txt) --needed --noconfirm
yaourt -S $(<yaourt_dependencies.txt) --m-arg --skippgpcheck --needed --noconfirm
cp -rv .config ~/
cp -rv .scripts ~/
systemctl enable slim.service
sudo cp -rv slim-minimal/ /usr/share/slim/themes/
sudo cp -rv slim.conf /etc/slim.conf
sudo mkdir /etc/lib/urxvt/perl
sudo cp -rv clipboard /etc/lib/urxvt/perl/
cp -rv .Xdefaults ~/
cp -rv .vimrc ~/
