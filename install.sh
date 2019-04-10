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

cd ..
yay --needed -S $(<aur_dependencies.txt)

cp -rv .scripts ~/
cp -rv .config ~/
cp -v .Xdefaults ~/
cp -v .bashrc ~/
cp -v .vimrc ~/
sudo pip install -r python_deps.txt

sudo Xorg -configure
sudo mv /root/xorg.conf.new /etc/X11/xorg.conf
