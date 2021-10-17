let g:viewdoc_openempty = 0
let g:no_plugin_maps = 1

if exists(':Alias')
  call CmdAlias('help', 'ViewDocHelp')
  call CmdAlias('man', 'ViewDocMan')
endif

nnoremap <silent> K :ViewDoc <cword><CR>
vnoremap <silent> K "hy:<C-u>ViewDoc <C-r>h<CR>

augroup vimrcs_plugins_viewdoc | au!
    au BufEnter [Doc* setlocal colorcolumn=0
augroup END
