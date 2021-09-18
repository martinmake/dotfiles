# vi mode
bindkey -v
export KEYTIMEOUT=1

MAGIC_ENTER_GIT_COMMAND='git status -u .'
MAGIC_ENTER_OTHER_COMMAND='l'

export ZSH_CUSTOM=$ZDOTDIR/custom

source $ZSH_CUSTOM/plugins/zsh-z/zsh-z.plugin.zsh

source $ZSH_CUSTOM/plugins/insulter/insulter.plugin.zsh
source $ZSH_CUSTOM/plugins/magic-enter/magic-enter.plugin.zsh

source $ZSH_CUSTOM/plugins/you-should-use/you-should-use.plugin.zsh
source $ZSH_CUSTOM/plugins/autoswitch-virtualenv/autoswitch_virtualenv.plugin.zsh

source $ZSH_CUSTOM/plugins/fzf-tab/fzf-tab.zsh
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:complete:*' fzf-preview 'bat -f $realpath 2>/dev/null || lsd -1 --color=always $realpath'
# preview directory's content with lsd when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1 --color=always $realpath'
# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:wrap


# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

export FZF_COMPLETION_TRIGGER='**'

source $ZSH_CUSTOM/plugins/vim-mode/zsh-vim-mode.plugin.zsh
source $ZSH_CUSTOM/plugins/vi-increment/vi-increment.plugin.zsh

source $ZSH_CUSTOM/plugins/syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

source $ZSH_CUSTOM/plugins/autopair/autopair.plugin.zsh

ZSH_AUTOSUGGEST_USE_ASYNC='true'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
ZSH_AUTOSUGGEST_IGNORE_WIDGETS=(
	orig-\*
	beep
	run-help
	set-local-history
	which-command
	yank
	yank-pop
	# zle-\* # breaks with zsh-syntax-highlighting
)
source $ZSH_CUSTOM/plugins/autosuggestions/zsh-autosuggestions.plugin.zsh

FG_DARK_BLACK='[30m'
FG_DARK_RED='[31m'
FG_DARK_GREEN='[32m'
FG_DARK_YELLOW='[33m'
FG_DARK_BLUE='[34m'
FG_DARK_MAGENTA='[35m'
FG_DARK_CYAN='[36m'
FG_DARK_WHITE='[37m'
FG_BRIGHT_BLACK='[90m'
FG_BRIGHT_RED='[91m'
FG_BRIGHT_GREEN='[92m'
FG_BRIGHT_YELLOW='[93m'
FG_BRIGHT_BLUE='[94m'
FG_BRIGHT_MAGENTA='[95m'
FG_BRIGHT_CYAN='[96m'
FG_BRIGHT_WHITE='[97m'
BG_DARK_BLACK='[40m'
BG_DARK_RED='[41m'
BG_DARK_GREEN='[42m'
BG_DARK_YELLOW='[43m'
BG_DARK_BLUE='[44m'
BG_DARK_MAGENTA='[45m'
BG_DARK_CYAN='[46m'
BG_DARK_WHITE='[47m'
BG_BRIGHT_BLACK='[100m'
BG_BRIGHT_RED='[101m'
BG_BRIGHT_GREEN='[102m'
BG_BRIGHT_YELLOW='[103m'
BG_BRIGHT_BLUE='[104m'
BG_BRIGHT_MAGENTA='[105m'
BG_BRIGHT_CYAN='[106m'
BG_BRIGHT_WHITE='[107m'

BOLD='[1m'
UNDERLINE='[4m'
NO_UNDERLINE='[24m'
REVERSE='[7m'
POSITIVE='[27m'
DEFAULT='[0m'

FG_ORANGE="$FG_DARK_YELLOW"
BG_ORANGE="$BG_DARK_YELLOW"
FG_DARK_GREY="$FG_DARK_WHITE"
BG_DARK_GREY="$BG_DARK_WHITE"
FG_BRIGHT_GREY="$FG_BRIGHT_BLACK"
BG_BRIGHT_GREY="$BG_BRIGHT_BLACK"

FG_BLACK="$FG_BRIGHT_BLACK"
FG_RED="$FG_BRIGHT_RED"
FG_GREEN="$FG_BRIGHT_GREEN"
FG_YELLOW="$FG_BRIGHT_YELLOW"
FG_BLUE="$FG_BRIGHT_BLUE"
FG_MAGENTA="$FG_BRIGHT_MAGENTA"
FG_CYAN="$FG_BRIGHT_CYAN"
FG_WHITE="$FG_BRIGHT_WHITE"
BG_BLACK="$BG_BRIGHT_BLACK"
BG_RED="$BG_BRIGHT_RED"
BG_GREEN="$BG_BRIGHT_GREEN"
BG_YELLOW="$BG_BRIGHT_YELLOW"
BG_BLUE="$BG_BRIGHT_BLUE"
BG_MAGENTA="$BG_BRIGHT_MAGENTA"
BG_CYAN="$BG_BRIGHT_CYAN"
BG_WHITE="$BG_BRIGHT_WHITE"

darkBlack='0'
darkRed='1'
darkGreen='2'
darkYellow='3'
darkBlue='4'
darkMagenta='5'
darkCyan='6'
darkWhite='7'
brightBlack='8'
brightRed='9'
brightGreen='10'
brightYellow='11'
brightBlue='12'
brightMagenta='13'
brightCyan='14'
brightWhite='15'

black="$darkBlack"
white="$brightWhite"

red="$brightRed"
green="$brightGreen"
yellow="$brightYellow"
blue="$brightBlue"
magenta="$brightMagenta"
cyan="$brightCyan"

darkGray="$darkWhite"
brightGray="$brightBlack"
orange="$yellow"

MODE_CURSOR_VICMD="block"
MODE_CURSOR_VIINS="bar"
MODE_CURSOR_VISUAL="block"
MODE_CURSOR_VLINE="block"
MODE_CURSOR_SEARCH="steady underline"
MODE_INDICATOR_VIINS=" %F{${blue}}<INSERT>%f"
MODE_INDICATOR_VICMD=" %F{${green}}[NORMAL]%f"
MODE_INDICATOR_REPLACE=" %F{${red}}[REPLACE]%f"
MODE_INDICATOR_SEARCH=" %F{${magenta}}[SEARCH]%f"
MODE_INDICATOR_VISUAL=" %F{${yellow}}[VISUAL]%f"
MODE_INDICATOR_VLINE=" %F{${yellow}}[V-LINE]%f"
ZLE_RPROMPT_INDENT=1
RPS1='${MODE_INDICATOR_PROMPT}'

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets root) # pattern line
ZSH_HIGHLIGHT_STYLES[root]="fg=$black,bg=$red,bold"

ZSH_HIGHLIGHT_STYLES[bracket-level-1]="fg=$cyan"
ZSH_HIGHLIGHT_STYLES[bracket-level-2]="fg=$magenta"
ZSH_HIGHLIGHT_STYLES[bracket-level-3]="fg=$cyan"
ZSH_HIGHLIGHT_STYLES[bracket-level-4]="fg=$magenta"

ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=$black,bg=$red,bold"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=$green,bold"
ZSH_HIGHLIGHT_STYLES[alias]="fg=$green,bold"
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg=$green,bold"
ZSH_HIGHLIGHT_STYLES[global-alias]="fg=$green,bold"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=$green,bold"
ZSH_HIGHLIGHT_STYLES[function]="fg=$green,bold"
ZSH_HIGHLIGHT_STYLES[command]="fg=$green,bold"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=$green,bold"
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=$red,bold"
ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=$green,bold"
ZSH_HIGHLIGHT_STYLES[autodirectory]="fg=$red"
ZSH_HIGHLIGHT_STYLES[path]="fg=$red"
ZSH_HIGHLIGHT_STYLES[path_pathseparator]="fg=$yellow"
ZSH_HIGHLIGHT_STYLES[path_prefix]="fg=$black,bg=$red,bold"
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]="fg=$yellow,bg=$red,bold"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=$magenta,bold"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=$black,bg=$blue,bold"
ZSH_HIGHLIGHT_STYLES[command-substitution]="fg=$magenta"
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]="fg=$red,underline,bold"
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]="fg=$magenta"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]="fg=$cyan"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]="fg=$black,bg=$red,bold"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]="fg=$magenta"
ZSH_HIGHLIGHT_STYLES[process-substitution]="fg=$magenta"
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]="fg=$cyan"
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]="fg=$magenta"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=$cyan"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=$cyan"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=$magenta"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]="fg=$black,bg=$red,bold"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]="fg=$cyan"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$red"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]="fg=$black,bg=$red,bold"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$red"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]="fg=$black,bg=$red,bold"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=$cyan"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]="fg=$black,bg=$red,bold"
ZSH_HIGHLIGHT_STYLES[rc-quote]="fg=$red"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=$cyan"
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=$cyan"
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]="fg=$cyan"
ZSH_HIGHLIGHT_STYLES[assign]="fg=$magenta"
ZSH_HIGHLIGHT_STYLES[redirection]="fg=$red,bold"
ZSH_HIGHLIGHT_STYLES[comment]="fg=$darkGreen"
ZSH_HIGHLIGHT_STYLES[named-fd]="fg=$white"
ZSH_HIGHLIGHT_STYLES[numeric-fd]="fg=$white"
ZSH_HIGHLIGHT_STYLES[arg0]="fg=$green,bold"
ZSH_HIGHLIGHT_STYLES[default]="fg=$white"

source $XDG_DATA_HOME/LS_COLORS.sh

save_command_start_time() { export COMMAND_START_TIME=$SECONDS }
save_command_time() { export COMMAND_TIME=$(($SECONDS - ${COMMAND_START_TIME:-SECONDS})) }
preexec() { save_command_start_time ;}
preexec_functions+=(save_command_start_time)
precmd_functions+=(save_command_time)

# Enable colors and change prompt:
autoload -U colors && colors
autoload -U promptinit && promptinit
setopt prompt_subst
export VIRTUAL_ENV_DISABLE_PROMPT=1
export AUTOSWITCH_MESSAGE_FORMAT="\033[1A"
prompt_system_location()
{
	printf "%%{$FG_RED%%}%s"    "["
	printf "%%{$FG_WHITE%%}%s"  "$(whoami)"
	printf "%%{$FG_YELLOW%%}%s" "@"
	printf "%%{$FG_WHITE%%}%s"  "$(hostname)"
	printf "%%{$FG_YELLOW%%}%s" ":"
	printf "%%{$FG_WHITE%%}%s"  "$(pwd)"
	printf "%%{$FG_RED%%}%s"    "]"
}
prompt_system_location_short()
{
	printf "%%{$FG_RED%%}%s"    "["
	printf "%%{$FG_WHITE%%}%s"  "$(whoami)"
	printf "%%{$FG_YELLOW%%}%s" "@"
	printf "%%{$FG_WHITE%%}%s"  "$(hostname)"
	printf "%%{$FG_YELLOW%%}%s" ":"
	printf "%%{$FG_WHITE%%}%s"  ".../$(basename $PWD)"
	printf "%%{$FG_RED%%}%s"    "]"
}
prompt_git_location()
{
	if git status >& /dev/null; then
		local REPO=$(git remote -v 2> /dev/null | head -n1 | awk '{print $2}' | sed -e 's/.*\///' -e 's/\.git//')
		local BRANCH=$(git branch 2> /dev/null | sed -n '/^\*/p' | cut -d' ' -f2)
		printf "%%{$FG_RED%%}%s"      "("
		printf "%%{$FG_WHITE%%}%s" "$BRANCH"
		printf "%%{$FG_YELLOW%%}%s"   "@"
		printf "%%{$FG_WHITE%%}%s"  "$REPO"
		printf "%%{$FG_RED%%}%s"      ")"
	fi
}
prompt_virtualenv()
{
	if [ -n "$VIRTUAL_ENV" ]; then
		if [ -f "$VIRTUAL_ENV/__name__" ]; then
			local NAME=`cat $VIRTUAL_ENV/__name__`
		elif [ `basename $VIRTUAL_ENV` = "__" ]; then
			local NAME=$(basename $(dirname $VIRTUAL_ENV))
		else
			local NAME=$(basename $VIRTUAL_ENV)
		fi
		printf "%%{$FG_RED%%}%s"      "{"
		printf "%%{$FG_WHITE%%}%s" "$NAME"
		printf "%%{$FG_RED%%}%s"      "}"
	fi
}
prompt_timepoint()
{
	printf "%%{$FG_RED%%}%s"              "["
	printf "%%{$FG_WHITE%%}%s"  "$(date '+%H')"
	printf "%%{$FG_YELLOW%%}%s"           ":"
	printf "%%{$FG_WHITE%%}%s"  "$(date '+%M')"
	printf "%%{$FG_YELLOW%%}%s"           ":"
	printf "%%{$FG_WHITE%%}%s"  "$(date '+%S')"
	printf "%%{$FG_RED%%}%s"              "]"
}
prompt_command_time()
{
	if [ "${COMMAND_TIME}" -gt 0 ]; then
		local SECONDS=$((${COMMAND_TIME}           % 60))
		local MINUTES=$((${COMMAND_TIME}      / 60 % 60))
		local   HOURS=$((${COMMAND_TIME} / 60 / 60 % 24))
		local    DAYS=$((${COMMAND_TIME} / 60 / 60 / 24))

		printf "%%{$FG_RED%%}%s" "("
		if [ "$DAYS" -gt 0 ]; then
			printf "%%{$FG_RED%%}%s" "${DAYS}d ${HOURS}h ${MINUTES}m ${SECONDS}s"
		elif [ "$HOURS" -gt 0 ]; then
			printf "%%{$FG_RED%%}%s"          "${HOURS}h ${MINUTES}m ${SECONDS}s"
		elif [ "$MINUTES" -gt 0 ]; then
			printf "%%{$FG_YELLOW%%}%s"                 "${MINUTES}m ${SECONDS}s"
		elif [ "$SECONDS" -gt 0 ]; then
			printf "%%{$FG_GREEN%%}%s"                              "${SECONDS}s"
		fi
		printf "%%{$FG_RED%%}%s" ")"

		printf "%%{$FG_YELLOW%%}%s" " @ "
	fi
}
prompt_returned()
{
	if [ "$1" -ne 0 ]; then
		printf "%%{$FG_RED%%}%s"    "<"
		printf "%%{$FG_YELLOW%%}%s" "!!"
		printf "%%{$FG_RED%%}%s"    "->"
		printf "%%{$FG_YELLOW%%}%s" "$1"
		printf "%%{$FG_RED%%}%s"    ">─"
	fi
}
prompt()
{
# 	if [[ "$(whoami)" == "root" ]]; then
# 		echo -n "%{$fg[yellow]%}#"
# 	else
# 		echo -n "%{$fg[yellow]%}$"
# 	fi

	local RET=$?
	local SIZE=0

	SIZE=$(($SIZE + $(prompt_system_location | sed -E 's/\%\{[^\%]*\%\}//g' | wc -m)))
	SIZE=$(($SIZE + $(prompt_git_location    | sed -E 's/\%\{[^\%]*\%\}//g' | wc -m)))
	SIZE=$(($SIZE + $(prompt_virtualenv      | sed -E 's/\%\{[^\%]*\%\}//g' | wc -m)))

	SIZE=$(($SIZE + $(prompt_returned $RET | sed -E 's/\%\{[^\%]*\%\}//g' | wc -m)))
	SIZE=$(($SIZE + $(prompt_command_time  | sed -E 's/\%\{[^\%]*\%\}//g' | wc -m)))
	SIZE=$(($SIZE + $(prompt_timepoint     | sed -E 's/\%\{[^\%]*\%\}//g' | wc -m)))

	echo -n '%B'

	if (($COLUMNS - ${SIZE} > 0)); then
		prompt_system_location
	else
		prompt_system_location_short
		SIZE=$(($SIZE - ( $(prompt_system_location | sed -E 's/\%\{[^\%]*\%\}//g' | wc -m) - $(prompt_system_location_short | sed -E 's/\%\{[^\%]*\%\}//g' | wc -m) )))
	fi
	prompt_git_location
	prompt_virtualenv

	echo -n "%{$FG_RED%}"
	for i in {1..$(($COLUMNS - ${SIZE}))}; do
		echo -n '─'
	done

	prompt_returned $RET
	prompt_command_time
	prompt_timepoint

	echo -ne "\n%{$reset_color%}"
}
PS1='$(prompt)'

# History in cache directory:
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000000000
SAVEHIST=10000000000
  setopt BANG_HIST              # Treat the '!' character specially during expansion.
  setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
  setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
unsetopt SHARE_HISTORY          # Share history between all sessions.
  setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
  setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
  setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
  setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
  setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
  setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
  setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
  setopt HIST_VERIFY            # Don't execute immediately upon history expansion.
  setopt HIST_BEEP              # Beep when accessing nonexistent history.

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

# Use $FILE to switch directories
fcd ()
{
	local tmp="$(mktemp)"
	if [ "$FILE" = "ranger" ]; then
		ranger --choosedir="$tmp" "$@"
	elif [ "$FILE" = "lf" ]; then
		lf -last-dir-path="$tmp" "$@"
	fi
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}
bindkey -s '' 'fcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey          'e' edit-command-line
bindkey -M vicmd 'e' edit-command-line

bindkey -M vicmd 'K' run-help
bindkey -r "h" # unbind run-help
bindkey -r "H" # unbind run-help

TIMEFMT=$'\n%J\n%U user\n%S system\n%P cpu\n%*E total'

stty -ixon # Disable ctrl-s and ctrl-q.

# Load aliases and shortcuts if existent.
[ -f "$XDG_CONFIG_HOME/shortcutrc" ] && source "$XDG_CONFIG_HOME/shortcutrc"
[ -f "$XDG_CONFIG_HOME/aliasrc"    ] && source "$XDG_CONFIG_HOME/aliasrc"

source $ZSH_CUSTOM/plugins/history-search-multi-word/history-search-multi-word.plugin.zsh
zstyle :plugin:history-search-multi-word reset-prompt-protect 1

ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
ZSH_SYSTEM_CLIPBOARD_SELECTION='CLIPBOARD'
source $ZSH_CUSTOM/plugins/system-clipboard/zsh-system-clipboard.plugin.zsh

# EASY_MOTION_TARGET_KEYS="asdghklqwertyuiopzxcvbnmfj;"
# EASY_MOTION_DIM="fg=245"
# EASY_MOTION_HIGHLIGHT="fg=196,bold"
# EASY_MOTION_HIGHLIGHT_2_FIRST="fg=#ffb400,bold"
# EASY_MOTION_HIGHLIGHT_2_SECOND="fg=#b98300,bold"
# bindkey -M vicmd ' ' vi-easy-motion
# source $ZSH_CUSTOM/plugins/easy-motion/easy_motion.plugin.zsh # breaks zsh-system-clipboard
