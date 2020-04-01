highlight! link EasyMotionShade NonMatch
highlight! link EasyMotionMoveHL Search
highlight! link EasyMotionTarget CurrentSearch
highlight! link EasyMotionTarget2First CurrentSearch
highlight! link EasyMotionTarget2Second Search

" let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 1
" let g:EasyOperator_line_do_mapping = 0
let g:EasyMotion_inc_highlight = 1
let g:EasyMotion_do_shade = 1

map <Leader> <Plug>(easymotion-prefix)
nmap ml <Plug>(easymotion-bd-jk)
nmap ml <Plug>(easymotion-overwin-line)
nmap mw <Plug>(easymotion-bd-w)
nmap mw <Plug>(easymotion-overwin-w)
nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap n <Plug>(easymotion-next)
nmap N <Plug>(easymotion-prev)

nmap <silent> <Plug>(easyoperator-line-cut) :call s:CutLines()<cr>
nmap <silent> <Plug>(easyoperator-line-substitute) :call s:SubstituteLines()<cr>

function! s:CutLines()
	let orig_pos = [line('.'), col('.')]
	call easyoperator#line#selectlines()
	normal! x
	keepjumps call cursor(orig_pos[0], orig_pos[1])
endfunction

function! s:SubstituteLines()
	let orig_pos = [line('.'), col('.')]
	call easyoperator#line#selectlines()
	normal! p
	keepjumps call cursor(orig_pos[0], orig_pos[1])
endfunction
