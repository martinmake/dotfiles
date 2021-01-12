let g:scratch_autohide = &hidden
let g:scratch_insert_autohide = 0
let g:scratch_height = 10
let g:scratch_persistence_file = g:vim_tmp_directory . '/scratchfile.txt'

let g:scratch_no_mappings = 1

nmap <silent> gs <plug>(scratch-insert-reuse)
nmap <silent> gS <plug>(scratch-insert-clear)
xmap <silent> gs <plug>(scratch-selection-reuse)
xmap <silent> gS <plug>(scratch-selection-clear)
