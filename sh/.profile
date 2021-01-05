#!/usr/bin/env sh

# Profile file. Runs on login.

# Default programs
export WM="bspwm"
export TERMINAL="st"
export EDITOR="nvim"
export FILE="lf"
export BROWSER="web-browser" # export BROWSER="tabbed-surf"
export READER="zathura"
export XLOCK="xlock"
export MERGE_EDITOR="vimdiff"
export MAIL="neomutt"
export CALENDAR="ikhal"
export NETWORK="nmtui"
export NEWS="newsboat"
export CALCULATOR="calc"
export NOTES="nvim -c VimwikiIndex"
export ABOOK="abook"
export TODOMAN="todo repl"
export COUNTDOWN="termdown"
export CXX="clang++"
export CC="clang"

# PATHs setup
export PATH="$PATH:$(ls $HOME/.scripts -RL | sed -ne '/:$/p' | tr -d '\n')"
export PATH="$PATH:/opt/cuda/bin"
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
export _Z_DATA=$XDG_DATA_HOME/z
export IPYTHONDIR=$XDG_DATA_HOME/ipython

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

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export QT_STYLE_OVERRIDE="kvantum"

# Switch escape and caps if tty:
sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null
set -o noclobber

print "\e]P0000000" #black
print "\e]P1cd0000" #darkred
print "\e]P200cd00" #darkgreen
print "\e]P3cdcd00" #brown
print "\e]P40000cd" #darkblue
print "\e]P5cd00cd" #darkmagenta
print "\e]P600cdcd" #darkcyan
print "\e]P7e5e5e5" #lightgrey
print "\e]P84d4d4d" #darkgrey
print "\e]P9ff0000" #red
print "\e]PA00ff00" #green
print "\e]PBffff00" #yellow
print "\e]PC0000ff" #blue
print "\e]PDff00ff" #magenta
print "\e]PE00ffff" #cyan
print "\e]PFffffff" #white
clear # remove background artifacting if any
# white block cursor
print "\e[?16;2;112;c"
setterm -background black -foreground white -store

# Start graphical server if WM is not already running.
whence startx >/dev/null && [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x "${WM}" >/dev/null && exec startx
[ "$TERM" = "linux" ] && [ "$TTY" != "/dev/tty2" ] && exec tmux new-session
