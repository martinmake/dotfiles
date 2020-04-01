let g:fzf_height = 20
let g:fzf_tags_command = 'sh -c "$(git rev-parse --git-dir)/hooks/ctags"'

function! s:fzf_statusline()
  highlight fzf ctermfg=NONE ctermbg=NONE
  execute "setlocal statusline=%#fzf#\\ "
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
