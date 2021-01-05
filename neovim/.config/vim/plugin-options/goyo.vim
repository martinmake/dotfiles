let g:goyo_height="100%"


nmap <silent> <leader>\ :Goyo<CR>

function! s:goyo_enter()
	set nocursorcolumn
endfunction
function! s:goyo_leave()
	set cursorcolumn
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
