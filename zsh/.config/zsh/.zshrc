source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2> /dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh                   2> /dev/null
source /usr/share/zsh/plugins/zsh-you-should-use/zsh-you-should-use.zsh                     2> /dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh           2> /dev/null
source /usr/share/zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh                 2> /dev/null

typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
typeset -g ZSH_SYSTEM_CLIPBOARD_SELECTION='PRIMARY'

# Enable colors and change prompt:
autoload -U colors && colors
autoload -U promptinit && promptinit
setopt prompt_subst
system_location()
{
	echo -n "%{$fg[yellow]%}""%n""%{$fg[green]%}""@""%{$fg[blue]%}""%M""%{$fg[green]%}"":""%{$fg[magenta]%}""%d""%{$fg[red]%}"
}
git_location()
{
	REPO=$(git remote -v 2> /dev/null | head -n1 | awk '{print $2}' | sed -e 's/.*\///' -e 's/\.git//')
	BRANCH=$(git branch 2> /dev/null | sed -n '/^\*/p' | cut -d' ' -f2)
	echo -n "%{$fg[yellow]%}""$BRANCH""%{$fg[green]%}""@""%{$fg[blue]%}""$REPO"
}
prompt()
{
	PROMPT_ERROR=$?

	echo -n "%B%{$fg[red]%}""[$(system_location)]"
	if git status >& /dev/null; then
		echo -n "%{$fg[red]%}""($(git_location)""%{$fg[red]%}"")"
	fi

	echo -n "\r""%{$fg[red]%}"
	DATE=$(date '+%H:%M:%S')
	MOVE=$(echo "$COLUMNS - ${#DATE}" | bc)
	echo -n "\033[${MOVE}C"
	echo -n $DATE

	echo ""

	if [ $PROMPT_ERROR != 0 ]; then
		echo -n "%{$fg[red]%}-> $PROMPT_ERROR "
	fi

	echo -n "%{$fg[cyan]%}"
	if [[ "$(whoami)" == "root" ]]; then
		echo -n "#"
	else
		echo -n "$"
	fi
	echo -n "%{$reset_color%}%b "

	echo ""
}
PS1='$(prompt)'

# History in cache directory:
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000000000
SAVEHIST=10000000000
setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY            # Don't execute immediately upon history expansion.
setopt HIST_BEEP              # Beep when accessing nonexistent history.

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
rangercd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'rangercd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc"    ] && source "$HOME/.config/aliasrc"

source "$HOME/.config/zsh/plugins/zsh-vim-mode.zsh" 2> /dev/null
MODE_CURSOR_VICMD="white block"
MODE_CURSOR_VIINS="white bar"
MODE_CURSOR_SEARCH="white steady underline"
MODE_INDICATOR_VIINS=' %F{8}<INSERT>%f'
MODE_INDICATOR_VICMD=' %F{2}[NORMAL]%f'
MODE_INDICATOR_REPLACE='%F{1}[REPLACE]%f'
MODE_INDICATOR_SEARCH=' %F{5}[SEARCH]%f'
MODE_INDICATOR_VISUAL=' %F{4}[VISUAL]%f'
MODE_INDICATOR_VLINE=' %F{4}[V-LINE]%f'
RPS1='${MODE_INDICATOR_PROMPT}${vcs_info_msg_0_}'

stty -ixon # Disable ctrl-s and ctrl-q.

bindkey -r "h" # unbind run-help
bindkey -r "H" # unbind run-help

if [ "$TERM" != "tmux-256color" ]; then
	( TERM=xterm-256color tmux new-session ) && exit
fi
