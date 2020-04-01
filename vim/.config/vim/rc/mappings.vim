"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> Leader
"    -> General
"    -> Motion related
"    -> Appearance
"    -> Filesystem and code navigation
"    -> Fast scripting
"    -> General editing
"    -> Command line
"    -> Code editing
"    -> Spell checking
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Changes to vim's defaults
onoremap b vb
onoremap B vB

" Leader
let mapleader=" "
let g:mapleader=" "
let g:maplocalleader=" "

" General
" if &clipboard[:10] == 'unnamedplus'
"     xnoremap <silent> <expr> p
"           \ ':<c-u>silent! call EasyClip#Paste#PasteTextVisualMode(''+'',1)<CR>'
"     xnoremap <silent> <expr> P
"           \ ':<c-u>silent! call EasyClip#Paste#PasteTextVisualMode(''+'',1)<CR>'
"     nnoremap <silent> s :<c-u>silent! call EasyClip#Substitute#OnPreSubstitute('+', 1)<CR>:silent! set opfunc=EasyClip#Substitute#SubstituteMotion<CR>g@
"     nnoremap <silent> S :<c-u>silent! call EasyClip#Substitute#SubstituteLine('+', 1)<CR>:silent! call repeat#set("\<plug>SubstituteLine")<CR>
" else
"     if &clipboard[:6] == 'unnamed'
"         xnoremap <silent> <expr> p
"               \ ':<c-u>silent! call EasyClip#Paste#PasteTextVisualMode(''*'',1)<CR>'
"         xnoremap <silent> <expr> P
"               \ ':<c-u>silent! call EasyClip#Paste#PasteTextVisualMode(''*'',1)<CR>'
"         nnoremap <silent> s :<c-u>silent! call EasyClip#Substitute#OnPreSubstitute('*', 1)<CR>:silent! set opfunc=EasyClip#Substitute#SubstituteMotion<CR>g@
"         nnoremap <silent> S :<c-u>silent! call EasyClip#Substitute#SubstituteLine('*', 1)<CR>:silent! call repeat#set("\<plug>SubstituteLine")<CR>
"     else
"         xnoremap <silent> <expr> p
"               \ ':<c-u>silent! call EasyClip#Paste#PasteTextVisualMode(''"'',1)<CR>'
"         xnoremap <silent> <expr> P
"               \ ':<c-u>silent! call EasyClip#Paste#PasteTextVisualMode(''"'',1)<CR>'
"         nnoremap <silent> s :<c-u>silent! call EasyClip#Substitute#OnPreSubstitute('"', 1)<CR>:silent! set opfunc=EasyClip#Substitute#SubstituteMotion<CR>g@
"         nnoremap <silent> S :<c-u>silent! call EasyClip#Substitute#SubstituteLine('"', 1)<CR>:silent! call repeat#set("\<plug>SubstituteLine")<CR>
"     endif
" endif

" nmap <c-n> <plug>EasyClipSwapPasteForward
" nmap <c-p> <plug>EasyClipSwapPasteBackwards

" nmap yc <Plug>(Exchange)
" xmap X <Plug>(Exchange)
" nmap ycc <Plug>(ExchangeClear)
" nmap ycs <Plug>(ExchangeLine)

" nmap d<leader>l <plug>(easyoperator-line-delete)
" nmap y<leader>l <plug>(easyoperator-line-yank)
" nmap c<leader>l <plug>(easyoperator-line-cut)
" nmap s<leader>l <plug>(easyoperator-line-substitute)

" omap <leader>l  <plug>(easyoperator-line-select)
" xmap <leader>l  <plug>(easyoperator-line-select)


" Appearance
nmap <silent> <leader>za :set foldenable!<CR>
nmap <ESC> :nohlsearch<CR>


" Filesystem and code navigation
" nnoremap <leader>jp g]

nmap <leader>nt <plug>NerdTreeStart
nmap <leader>tb :let g:tagbar_width=helpers#free_hspace()<CR>:TagbarToggle<CR>

nmap <leader>gt :Windows<CR>
nmap <leader>cp :call helpers#call_from_git_root('FZF')<CR>

if executable('rg') || executable('ag')
  let g:grep_opts = ''
elseif executable('git')
  let g:grep_opts = '-F'
elseif executable('ack')
  let g:grep_opts = '-Q'
else
  let g:grep_opts = ''
endif

xmap <silent> <leader>ag y:call FastGrepFirstRoot(substitute(@0, '--', '', 'g'), g:grep_opts)<CR>
xmap <silent> <leader>gp y:call FastGrepLastRoot(substitute(@0, '--', '', 'g'), g:grep_opts)<CR>

exec "nmap <leader>ag :FastGrepU "
exec "nmap <leader>gp :FastGrepL "

nmap <silent> <leader>en :call EnMasse()<CR>

map <leader>cd :cd %:p:h<CR>:pwd<CR>
map <silent> <leader>te :call helpers#call_from_last_root_dir('FZF')<CR>

if exists(":GrokRef")
  map <silent> <leader>rf :GrokRef<CR><CR>
else
  map <silent> <Leader>rf :call rtags#FindRefs()<CR>
endif

" Fast scripting and ide-like features
nmap <leader>xx <plug>(execute-file)
nmap <leader>vx <plug>(view-file)
nmap <leader>le <plug>(view-compilation-status)

if empty($TMUX)
	map <silent> <leader>ip :execute helpers#free_hspace()
		\ . 'vsplit term://ptipython3'<CR>

	execute 'map <silent> <leader>sh :execute helpers#free_hspace() ' .
		\'. "vsplit term://" . &shell<CR>'
else
	map <silent> <leader>ip :call system(
		\ 'tmux split -h -l ' . helpers#free_hspace() . ' ptipython3')<CR>

	map <silent> <leader>sh :call system(
		\ 'tmux split -h -l ' . helpers#free_hspace())<CR>
endif

let g:state="code"
function! ChangeState()
  let a:cursor_pos = getpos(".")
  if !exists(':LLmode')
      exec "normal :LLsession new\<CR>"
  else
    if g:state=="code"
      exec "normal :LLmode debug\<CR>"
      let g:state="debug"
    else
      let g:state="code"
      exec "normal :LLmode code\<CR>"
    endif
  endif
  exec cursor(a:cursor_pos[1], a:cursor_pos[2])
endfunction
nmap <silent> <leader>dd :call ChangeState()<CR>

nmap <leader>bp <Plug>LLBreakSwitch

nmap <silent> <leader>pt :LL print <C-R>=expand('<cword>')<CR><CR>
vmap <silent> <leader>pt :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>

nmap <silent> <M-cr> :LL continue<CR>
nmap <silent> <M-j> :LL next<CR>
nmap <silent> <M-l> :LL step<CR>
nmap <silent> <M-k> :LL reverse-next<CR>
nmap <silent> <M-h> :LL finish<CR>


" General editing
xmap <leader>ga <plug>(EasyAlign)
nmap <leader>ga <plug>(EasyAlign)

noremap <leader>va ggVG

" imap <silent> <leader>lt <esc>:call unicoder#start(1)<CR>
" vmap <silent> <leader>lt :<c-u>call unicoder#selection()<CR>

nmap <silent> <leader>ux mmHmt:%s/<c-V><CR>//ge<CR>:retab<CR>'tzt'm

nmap <silent> <leader>gs <plug>(scratch-insert-reuse)
nmap <silent> <leader>gS <plug>(scratch-insert-clear)
xmap <silent> <leader>gs <plug>(scratch-selection-reuse)
xmap <silent> <leader>gS <plug>(scratch-selection-clear)


" Command line
	cnoremap <C-P> <UP>
	cnoremap <C-N> <DOWN>

	cnoremap <S-CR> <C-F>
	cmap <silent> <C-R> History:<CR>

" Spell checking
	map <silent> <leader>ss :setlocal spell!<CR>

" Folding setup:
	nnoremap <leader><leader> za

" Auto brackets
	inoremap {<CR> <CR>{<CR>}<ESC>O
	inoremap {; <CR>{<CR>};<ESC>O

" switch source to include and vice versa:
	nmap <C-s> :call CurtineIncSw()<CR>

" toggle text limiting
	nmap <leader>lt :call ToggleLimitText()<CR>
	let g:is_limit_text=1
	function! ToggleLimitText()
		if g:is_limit_text
			let g:is_limit_text=0
			match OverLength /$^/
			let &colorcolumn = 0
		else
			let g:is_limit_text=1
			match OverLength /\%81v.*/
			let &colorcolumn = g:colorcolumn
		endif
	endfunction

" commenting
	nmap <C-C> gcc
	vmap <C-C> gc

" repeat motion with f and t
	nnoremap ; <NOP>
	nnoremap , <NOP>

" jump movement setup:
	noremap <C-F> <C-I>
	noremap <C-B> <C-O>

" toggle line wrap
	map <leader>lw :set wrap!<CR>

" substitute
	nmap S :%s//g<LEFT><LEFT>
	vmap S :s//g<LEFT><LEFT>

" search setup:
	vmap <Plug>N N

" esearch
    call esearch#map('<leader>es', 'esearch')

" toggle orthography
	map <leader>o :setlocal spell!<CR>

" Nerd tree
	nmap <leader>t :NERDTreeToggle<CR>

" FZF setup:
	nmap <leader>ff :wa! \| FZF<CR>
	let g:fzf_action = {
	  \ 'ctrl-t': 'tab split',
	  \ 'enter':  'tab split',
	  \ 'ctrl-x': 'split',
	  \ 'ctrl-v': 'vsplit' }

" tab setup:
	nmap <M-1> 1gt
	nmap <M-2> 2gt
	nmap <M-3> 3gt
	nmap <M-4> 4gt
	nmap <M-5> 5gt
	nmap <M-6> 6gt
	nmap <M-7> 7gt
	nmap <M-8> 8gt
	nmap <M-9> 9gt
	nmap <M-0> 10gt
	imap <M-1> <C-O>1gt
	imap <M-2> <C-O>2gt
	imap <M-3> <C-O>3gt
	imap <M-4> <C-O>4gt
	imap <M-5> <C-O>5gt
	imap <M-6> <C-O>6gt
	imap <M-7> <C-O>7gt
	imap <M-8> <C-O>8gt
	imap <M-9> <C-O>9gt
	imap <M-0> <C-O>10gt

" Debugging setup:
	nmap <leader>b :BreakpointToggle<CR>

" Util setup:
	nmap <leader>rf :read !find -name ''<LEFT>
	nmap <leader>rsf :read !find -regextype sed -regex '.*\.\(h\\|hh\\|hpp\\|c\\|cc\\|cpp\\|cxx\\|s\\|S\)$' \| sort<CR>
	nmap <leader>rsd :read !find -type d -name '*' \| sort<CR>
	nmap <leader>x  :wa! \| !./%<CR>
	nmap <leader>mx :wa! \| !chmod +x %<CR>
	nmap <leader>mt :wa! \| !clear; ctags --exclude=.git --exclude='*.log' -R * <CR>

" Check file in shellcheck:
	map <leader>sc :wa! \| !shellcheck %<CR>

" Makefile setup:
	nmap <leader>ma :wa! \| !clear; time make<CR>
	nmap <leader>mc :wa! \| !clear; time make clean<CR>
	nmap <leader>mf :wa! \| !clear; time make flash<CR>
	nmap <leader>ms :wa! \| !clear;      make serial<CR>
	nmap <leader>mv :wa! \| !clear;      make vcp<CR>

" git setup:
	map <leader>gs  :Gstatus<CR>
	map <leader>gpl :Gstatus<CR>
	map <leader>gps :Gstatus<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Swap bettween hex and plain text views
	nmap <leader>h :call ToggleHexView()<CR>
	let g:is_hex_view=1
	function! ToggleHexView ()
		if g:is_hex_view
			let g:is_hex_view=0
			%!xxd -r
		else
			let g:is_hex_view=1
			%!xxd
		endif
	endfunction

" ultisnip
	let g:UltiSnipsExpandTrigger='<Tab>'
	let g:UltiSnipsJumpForwardTrigger='<Tab>'
	let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

" ycm
map <leader>yr  :YcmRestartServer<CR>
map <leader>gdf :YcmCompleter GoToDefinition<CR>
map <leader>gdc :YcmCompleter GoToDeclaration<CR>
map <leader>gi  :YcmCompleter GoToInclude<CR>
map <leader>gt  :YcmCompleter GetType<CR>
map <leader>fi  :YcmCompleter FixIt<CR>
map <leader>sd  :YcmCompleter GetDoc<CR>
let g:ycm_key_list_select_completion=['<C-N>']
let g:ycm_key_list_previous_completion=['<C-P>']
