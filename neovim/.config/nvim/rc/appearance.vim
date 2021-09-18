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
	set fillchars+=vert:█

" Height of the command bar
	set cmdheight=2
	set showtabline=2

" Always show current position
	set ruler

" Show line numbers
	set number
	set relativenumber

" Show cursor cross
set cursorline cursorcolumn
augroup CursorCross
	autocmd!
	autocmd WinEnter * set   cursorline   cursorcolumn
	autocmd WinLeave * set nocursorline nocursorcolumn
augroup END

" search
	set hlsearch
	set incsearch
" tabbing
	set tabstop=8
	set shiftwidth=0
	set softtabstop=0
	" let g:indentLine_char_list= ['┃', '|', '¦', '┊', ':']
	let g:indentLine_char_list= ['┃']
	" →▸☠¶␣┃·•«»↵¬¶╂─͜
	set listchars=tab:┃\ ,space:·,trail:•,precedes:«,extends:»
	" set listchars=tab:╂─,space:·,trail:•,eol:¬,precedes:«,extends:»
	set list
" folding {{{
	set foldenable
	set foldminlines=1
	set foldlevelstart=0
	set foldmethod=marker
	set foldmarker={{{,}}}
	set fillchars+=foldopen:┬,foldclose:+
	set foldcolumn=1
" }}}
" statusline {{{
	" unicode just won't work
	" set fillchars+=stl:-
	" set fillchars+=stlnc:-
" }}}

set shortmess=cfilmnrwxF
set visualbell
set display=lastline,msgsep
set signcolumn=yes

" LSP
	highlight LspDiagnosticsDefaultError       ctermfg=red    ctermbg=black cterm=bold
	highlight LspDiagnosticsDefaultWarning     ctermfg=3      ctermbg=black cterm=bold
	highlight LspDiagnosticsDefaultInformation ctermfg=blue   ctermbg=black cterm=bold
	highlight LspDiagnosticsDefaultHint        ctermfg=yellow ctermbg=black cterm=bold
	highlight link LspDiagnosticsError           LspDiagnosticsDefaultError
	highlight link LspDiagnosticsWarning         LspDiagnosticsDefaultWarning
	highlight link LspDiagnosticsInformation     LspDiagnosticsDefaultInformation
	highlight link LspDiagnosticsHint            LspDiagnosticsDefaultHint
	highlight link LspDiagnosticsSignError       LspDiagnosticsDefaultError
	highlight link LspDiagnosticsSignWarning     LspDiagnosticsDefaultWarning
	highlight link LspDiagnosticsSignInformation LspDiagnosticsDefaultInformation
	highlight link LspDiagnosticsSignHint        LspDiagnosticsDefaultHint
	sign define LspDiagnosticsSignError       text= texthl=LspDiagnosticsError       linehl= numhl=
	sign define LspDiagnosticsSignWarning     text= texthl=LspDiagnosticsWarning     linehl= numhl=
	sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsInformation linehl= numhl=
	sign define LspDiagnosticsSignHint        text= texthl=LspDiagnosticsHint        linehl= numhl=

" Color column
let g:colorcolumn=80
" match OverLength /\%81v.*/
match OverLength /$^/
let &colorcolumn=0
