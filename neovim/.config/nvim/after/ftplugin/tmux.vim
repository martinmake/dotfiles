if !exists("tmux_after_autocommands_loaded")
	autocmd bufWritePost * !tmux source-file %
end
let g:tmux_after_autocommands_loaded=1
