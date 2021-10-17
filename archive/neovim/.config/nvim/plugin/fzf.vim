let g:fzf_height = 21
" let g:fzf_tags_command = 'sh -c "$(git rev-parse --git-dir)/hooks/ctags"'
" let g:fzf_colors = {
" 	\ 'fg':      ['fg', 'Normal'],
" 	\ 'bg':      ['bg', 'Normal'],
" 	\ 'hl':      ['fg', 'Comment'],
" 	\ 'fg+':     ['fg', 'Visual'],
" 	\ 'bg+':     ['bg', 'Warning'],
" 	\ 'hl+':     ['fg', 'Statement'],
" 	\ 'info':    ['fg', 'PreProc'],
" 	\ 'border':  ['fg', 'CursorLineNr'],
" 	\ 'prompt':  ['fg', 'Conditional'],
" 	\ 'pointer': ['fg', 'Cursor'],
" 	\ 'marker':  ['fg', 'Keyword'],
" 	\ 'spinner': ['fg', 'SpecialKey'],
" 	\ 'header':  ['fg', 'Comment'] }
let g:fzf_layout = { 'window': {
	\ 'width':   1.0,
	\ 'height':  0.4,
	\ 'border':  'top',
	\ 'yoffset': 1.0, } }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'enter':  'edit',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :GFiles<CR>
nnoremap <silent> <leader>fc :BCommits<CR>
nnoremap <silent> <leader>gr :Rg<space>

imap <c-f><c-w> <plug>(fzf-complete-word)
imap <c-f><c-p> <plug>(fzf-complete-path)
imap <c-f><c-l> <plug>(fzf-complete-line)
