augroup sxhkdrc
	au!
	autocmd BufWritePost <buffer> !pkill -USR1 sxhkd
augroup END

setlocal commentstring=#\ %s
