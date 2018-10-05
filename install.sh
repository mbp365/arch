#!/bin/sh

sudo pacman -Syu

sudo pacman -S archlinux-keyring
sudo pacman-key --populate
sudo pacman-key --refresh-keys
sudo pacman -Syu

sudo pacman --needed -S $(<pacman_dependencies.txt)

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay --needed -S $(<aur_dependencies.txt)

cp -rv .scripts ~/
sudo cp -v override.conf /etc/systemd/system/getty@tty1.service.d/override.conf
cp -v .Xdefaults ~/
cp -v .bashrc ~/
cp -v .vimrc ~/
sudo cp -v xorg.conf /etc/X11/xorg.conf
sudo pip install -r python_deps.txt
