nmap #   <Plug>(searchhi-update)
nmap g*  <Plug>(searchhi-update)
nmap g#  <Plug>(searchhi-update)
nmap z*  <Plug>(searchhi-update)
nmap z#  <Plug>(searchhi-update)
nmap gz* <Plug>(searchhi-update)
nmap gz# <Plug>(searchhi-update)
nmap n   <Plug>(searchhi-n)
nmap N   <Plug>(searchhi-N)
nmap #   <Plug>(searchhi-#)
nmap gd  <Plug>(searchhi-gd)
nmap gD  <Plug>(searchhi-gD)
" nmap <ESC> <Plug>(searchhi-clear-all)
" vmap <ESC> <Plug>(searchhi-v-clear-all)
let g:searchhi_user_autocmds_enabled=1
let g:searchhi_redraw_before_on=1
augroup searchhi
	autocmd!
	autocmd User SearchHiOn AnzuUpdateSearchStatusOutput
	autocmd User SearchHiOff echo g:anzu_no_match_word
augroup END
