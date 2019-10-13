#!/bin/sh

if ! which yay > /dev/null; then
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	rm -R yay
fi
yay -S --needed - < pkglist
