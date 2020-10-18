"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> Colorscheme
"    -> Disable scrollbars
"    -> Set font and font size
"    -> Window splitter
"    -> Height of the command bar
"    -> Always show current position
"    -> Show line numbers
"    -> Color column
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" custom theme
colorscheme mechanical

" Cursor shape (doesn't quite work)
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
elseif empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Window splitter
set fillchars+=vert:\┃

" Height of the command bar
set cmdheight=2
set showtabline=2

" Always show current position
	set ruler

" Show line numbers
	set number
	set relativenumber

" Show cursor cross
	set cursorline
	set cursorcolumn

" search
	set hlsearch
	set incsearch
" tabbing
	set tabstop=8
	set shiftwidth=0
	set softtabstop=0
	" let g:indentLine_char_list= ['|', '¦', '┊']
	" let g:indentLine_char_list= ['|']
	let g:indentLine_char_list= ['┃']
	set list
	set listchars=tab::·,space:·,trail:·,extends:>,precedes:<,conceal:*
	" set listchars=tab:\|.,space:.,trail:.,extends:>,precedes:<,conceal:*
" folding {{{
	set foldenable
	set foldminlines=0
	set foldlevel=99
	set foldmethod=marker
	set foldmarker={{{,}}}
	set foldcolumn=0
" }}}

set shortmess=cfilmnrwxF
set visualbell
set display=lastline,msgsep
set signcolumn=yes

" Color column
let g:colorcolumn=80
set colorcolumn=80
match OverLength /\%81v.*/
