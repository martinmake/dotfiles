augroup xdefaults
	au!
	autocmd BufWritePost <buffer> !xrdb %
augroup END
