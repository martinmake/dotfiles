" UltiSnip configuration
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
let g:UltiSnipsMappingsToIgnore=['autocomplete']

" YCM configuration
let g:ycm_key_list_select_completion=['<C-n>']
let g:ycm_key_list_previous_completion=['<C-p>']
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_auto_trigger=1
let g:ycm_max_diagnostics_to_display=0
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_add_preview_to_completeopt=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_use_ultisnips_completer=1
let g:ycm_use_clangd=1
let g:ycm_clangd_uses_ycmd_caching=1
let g:ycm_complete_in_comments=1
" let g:ycm_clangd_binary_path='/usr/bin/clangd'

" Highlight
highlight YcmWarningSection ctermfg=yellow cterm=bold,reverse
highlight YcmWarningSign    ctermfg=yellow cterm=bold,reverse
highlight YcmErrorSection   ctermfg=red    cterm=bold,reverse
highlight YcmErrorSign      ctermfg=red    cterm=bold,reverse

" Mappings
map <leader>yr   :YcmRestartServer<CR>
map <leader>gdef :YcmCompleter GoToDefinition<CR>
map <leader>gdec :YcmCompleter GoToDeclaration<CR>
map <leader>gi   :YcmCompleter GoToInclude<CR>
map <leader>gdoc :YcmCompleter GetDoc<CR>
map <leader>gt   :YcmCompleter GetType<CR>
map <leader>f    :YcmCompleter FixIt<CR>
