map <leader>/ <Plug>(incsearch-fuzzy-/)
map <leader>? <Plug>(incsearch-fuzzy-?)
augroup incsearch-keymap
	autocmd!
	autocmd VimEnter * call s:incsearch_keymap()
augroup END
function! s:incsearch_keymap()
	IncSearchNoreMap <C-n> <Over>(incsearch-next)
	IncSearchNoreMap <C-p> <Over>(incsearch-prev)
	IncSearchNoreMap <C-f> <Over>(incsearch-scroll-f)
	IncSearchNoreMap <C-b> <Over>(incsearch-scroll-b)
endfunction
