let g:UltiSnipsSnippetDirectories=[g:vim_config_directory.'/snip']

let g:UltiSnipsEditSplit = 'horizontal'

let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsUsePythonVersion = 3

let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<C-n>'
let g:UltiSnipsJumpBackwardTrigger='<C-p>'

nnoremap <silent> <leader>es :UltiSnipsEdit<CR>
