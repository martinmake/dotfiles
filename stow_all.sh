#!/bin/sh

which stow &> /dev/null
[ "$?" = "1" ] && echo "INSTALL STOW" && exit 1

PACKAGES=$(ls --hide='*.md' --hide='*.sh' --hide='pkglist')

stow -v -R -t $HOME $PACKAGES
