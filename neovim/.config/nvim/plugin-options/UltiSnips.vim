let g:UltiSnipsSnippetDirectories=[g:vim_config_directory.'/UltiSnips']

let g:UltiSnipsEditSplit = 'horizontal'

let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsUsePythonVersion = 3

let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<TAB>'
let g:UltiSnipsJumpBackwardTrigger='<S-TAB>'

nnoremap <silent> <leader>es :UltiSnipsEdit<CR>
