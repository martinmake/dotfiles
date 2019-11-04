#!/bin/sh
# Profile file. Runs on login.

# Default programs
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"

# PATHs setup
export PATH="$PATH:/opt/cuda/bin:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PYTHONPATH="$PYTHONPATH:$HOME/Documents/libs/PC/int/python"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/Documents/libs/PC/lib"
export GROFF_TMAC_PATH="$GROFF_TMAC_PATH:$HOME/.config/groff/tmac"

export QT_QPA_PLATFORMTHEME="qt5ct"
export DOT="$HOME/dotfiles"
export ZDOTDIR="$HOME/.config/zsh"
export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

export MAKEFLAGS="-j4"
export FZF_DEFAULT_COMMAND="find -type f"
export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')";
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')";
export LESS_TERMCAP_me="$(printf '%b' '[0m')";
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')";
export LESS_TERMCAP_se="$(printf '%b' '[0m')";
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')";
export LESS_TERMCAP_ue="$(printf '%b' '[0m')";

[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && . "$HOME/.config/bash/.bashrc"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Start syncthing
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec syncthing

# Switch escape and caps if tty:
sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null

# disable scroll lock
stty -ixon
