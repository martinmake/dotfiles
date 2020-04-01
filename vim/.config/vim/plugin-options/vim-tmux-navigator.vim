let g:tmux_navigator_no_mappings = 1

nnoremap <C-H> :TmuxNavigateLeft<CR>
nnoremap <C-J> :TmuxNavigateDown<CR>
nnoremap <C-K> :TmuxNavigateUp<CR>
nnoremap <C-L> :TmuxNavigateRight<CR>
inoremap <C-H> <ESC>:TmuxNavigateLeft<CR>
inoremap <C-J> <ESC>:TmuxNavigateDown<CR>
inoremap <C-K> <ESC>:TmuxNavigateUp<CR>
inoremap <C-L> <ESC>:TmuxNavigateRight<CR>
