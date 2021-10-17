augroup dircolors
	au!
	autocmd BufWritePost <buffer> !dircolors -b % > $XDG_DATA_HOME/LS_COLORS.sh
augroup END
