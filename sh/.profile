#!/bin/sh
# Profile file. Runs on login.

# Default programs
export EDITOR="nvim"
export TERMINAL="st"
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

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Start syncthing
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec syncthing

# Switch escape and caps if tty:
sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null

# `man set` && `/noclobber` you dummy
set -o noclobber

[ "$TERM" = "linux" ] && ( tmux attach || tmux new-session )
