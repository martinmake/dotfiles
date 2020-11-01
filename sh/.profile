#!/bin/sh
# Profile file. Runs on login.

# Default programs
export WM="bspwm"
export EDITOR="nvim"
export TERMINAL="stx"
export BROWSER="surf"
export READER="zathura"
export FILE="ranger"
export CXX="clang++"
export CC="clang"

# PATHs setup
export PATH="$PATH:/opt/cuda/bin:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:/root/.gem/ruby/2.7.0/bin"
export PYTHONPATH="$PYTHONPATH:$HOME/Documents/libs/PC/int/python"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/Documents/libs/PC/lib"

export ESPIDF=/opt/esp-idf
export IDF_PATH=/opt/esp-idf
export R_HOME=$HOME/.R
export GOPATH=$HOME/.go
export NODE_PATH=$HOME/.node_modules
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config

export GROFF_TMAC_PATH="$GROFF_TMAC_PATH:$XDG_CONFIG_HOME/groff/tmac"
export QT_QPA_PLATFORMTHEME="qt5ct"
export DOT="$HOME/dotfiles"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

export MAKEFLAGS="-j4 --no-print-directory"
export FZF_DEFAULT_COMMAND="find -type f 2>/dev/null"
export FZF_DEFAULT_OPTS="--multi --cycle --color='dark,fg:15,fg+:0,bg:0,bg+:13,info:2,gutter:0,border:0,spinner:2,hl:14,header:0,pointer:0,marker:9,prompt:15,hl+:15'"
export TIMEFMT="$'\nreal\t%E\nuser\t%U\nsys\t%S'"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')";
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')";
export LESS_TERMCAP_me="$(printf '%b' '[0m')";
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')";
export LESS_TERMCAP_se="$(printf '%b' '[0m')";
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')";
export LESS_TERMCAP_ue="$(printf '%b' '[0m')";

[ ! -f "$XDG_CONFIG_HOME/shortcutrc" ] && shortcuts >/dev/null 2>&1

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && . "$XDG_CONFIG_HOME/bash/.bashrc"

# Switch escape and caps if tty:
sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null

# `man set` && `/noclobber` you dummy
set -o noclobber

# Start graphical server if WM is not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x "${WM}" >/dev/null && exec startx

# Start syncthing
# [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x syncthing >/dev/null && exec syncthing

if [ "$TERM" = "linux" ]; then
	print "\e]P0000000" #black
	print "\e]P1FF0000" #darkred
	print "\e]P200FF00" #darkgreen
	print "\e]P3FFFF00" #brown
	print "\e]P40000FF" #darkblue
	print "\e]P5FF00FF" #darkmagenta
	print "\e]P600FFFF" #darkcyan
	print "\e]P7FFFFFF" #lightgrey
	print "\e]P8000000" #darkgrey
	print "\e]P9FF0000" #red
	print "\e]PA00FF00" #green
	print "\e]PBFFFF00" #yellow
	print "\e]PC0000FF" #blue
	print "\e]PDFF00FF" #magenta
	print "\e]PE00FFFF" #cyan
	print "\e]PFFFFFFF" #white
	clear # remove background artifacting if any

	# white block cursor
	print "\e[?16;2;112;c"

	setterm -background black -foreground white -store

	tmux new-session && exit
fi
