if !exists("sxhkdrc_after_autocommands_loaded")
	autocmd BufWritePost * !pkill -USR1 sxhkd
end
let g:sxhkdrc_after_autocommands_loaded=1
setlocal commentstring=#\ %s
