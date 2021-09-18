augroup crontab
	autocmd!
	autocmd BufWritePost <buffer> !crontab %
augroup END
