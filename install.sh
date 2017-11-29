#!/bin/sh

sudo pacman -Syu
sudo pacman -S $(<pacman_dependencies.txt) --needed --noconfirm
#install pacaur
curl -s https://gist.githubusercontent.com/Tadly/0e65d30f279a34c33e9b/raw/pacaur_install.sh | bash
pacaur -S $(<aur_dependencies.txt) --m-arg --skippgpcheck --needed --noconfirm
cp -rv .config ~/
cp -rv .scripts ~/
sudo cp -v slim.conf /etc/slim.conf
sudo cp -v clipboard /usr/lib/urxvt/perl/
sudo cp -v override.conf /etc/systemd/system/getty@tty1.service.d/override.conf
cp -v .Xdefaults ~/
cp -v .bashrc ~/
cp -v .vimrc ~/
sudo cp -v xorg.conf /etc/X11/xorg.conf
