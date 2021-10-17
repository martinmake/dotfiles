augroup incsearch-keymap
	autocmd!
	autocmd VimEnter * call s:incsearch_keymap()
augroup END
function! s:incsearch_keymap()
	IncSearchNoreMap <C-n> <Over>(incsearch-next)
	IncSearchNoreMap <C-p> <Over>(incsearch-prev)
	IncSearchNoreMap <C-f> <Over>(incsearch-scroll-f)
	IncSearchNoreMap <C-b> <Over>(incsearch-scroll-b)
endfunction

function! s:config_easyfuzzymotion_f(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> / incsearch#go(<SID>config_easyfuzzymotion_f())
