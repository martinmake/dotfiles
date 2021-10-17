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

" Appearance
nmap <silent> <leader>za :set foldenable!<CR>
nmap <ESC> :nohlsearch<CR>

" Filesystem and code navigation
" nnoremap <leader>jp g]

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

nmap <silent> <leader>en :call EnMasse()<CR>

map gcd :cd %:p:h<CR>:pwd<CR>
map <silent> <leader>te :call helpers#call_from_last_root_dir('FZF')<CR>

map <silent> <Leader>rf :call rtags#FindRefs()<CR>

" Fast scripting and ide-like features
" nmap <leader>xx <plug>(execute-file)
" nmap <leader>vx <plug>(view-file)
" nmap <leader>le <plug>(view-compilation-status)

if empty($TMUX)
	nmap <silent> <leader>ip :execute helpers#free_hspace()
		\ . 'vsplit term://ptipython3'<CR>

	execute 'map <silent> <leader>sh :execute helpers#free_hspace() ' .
		\'. "vsplit term://" . &shell<CR>'
else
	nmap <silent> <leader>ip :call system(
		\ 'tmux split -h -l ' . helpers#free_hspace() . ' ptipython3')<CR>

	" nmap <silent> <leader>sh :call system(
	" 	\ 'tmux split -h -l ' . helpers#free_hspace())<CR>
endif

" let g:state="code"
" function! ChangeState()
"   let a:cursor_pos = getpos(".")
"   if !exists(':LLmode')
"       exec "normal :LLsession new\<CR>"
"   else
"     if g:state=="code"
"       exec "normal :LLmode debug\<CR>"
"       let g:state="debug"
"     else
"       let g:state="code"
"       exec "normal :LLmode code\<CR>"
"     endif
"   endif
"   exec cursor(a:cursor_pos[1], a:cursor_pos[2])
" endfunction
" nmap <silent> <leader>dd :call ChangeState()<CR>

" nmap <leader>bp <Plug>LLBreakSwitch
" nmap <silent> <leader>pt :LL print <C-R>=expand('<cword>')<CR><CR>
" vmap <silent> <leader>pt :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>

" nmap <silent> <M-cr> :LL continue<CR>
" nmap <silent> <M-j> :LL next<CR>
" nmap <silent> <M-l> :LL step<CR>
" nmap <silent> <M-k> :LL reverse-next<CR>
" nmap <silent> <M-h> :LL finish<CR>

noremap <leader>va ggVG

vmap <leader>b !boxes -s 80 -d <space>

" imap <silent> <leader>lt <esc>:call unicoder#start(1)<CR>
" vmap <silent> <leader>lt :<c-u>call unicoder#selection()<CR>

nmap <silent> <leader>ux mmHmt:%s/<c-V><CR>//ge<CR>:retab<CR>'tzt'm

" Command line
	cnoremap <C-P> <UP>
	cnoremap <C-N> <DOWN>

	cnoremap <S-CR> <C-F>
	cmap <silent> <C-R> History:<CR>

" Spell checking
	" nmap <silent> <leader>ss :setlocal spell!<CR>

nnoremap <silent> <C-d> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> <C-h> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>Sr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>Ss <cmd>lua vim.lsp.buf.document_symbol()<CR>

" Folding setup:
	nnoremap <leader><leader> za

" Auto brackets
	inoremap {<CR> <CR>{<CR>}<ESC>O
	inoremap {; <CR>{<CR>};<ESC>O

" toggle text limiting
	nmap <leader>lt :call ToggleLimitText()<CR>
	let g:is_limit_text=0
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
	nmap <C-c> gcc
	vmap <C-c> gc<ESC>

" repeat motion with f and t
	nnoremap ; <NOP>
	nnoremap , <NOP>

" jump movement setup:
	noremap <C-F> <C-I>
	noremap <C-B> <C-O>

" scroll-move and remap join
	noremap <M-h> hzh
	noremap <M-j> j<C-E>
	noremap <M-k> k<C-Y>
	noremap <M-l> lzl

xnoremap <silent> @ :<C-u>call ExecuteMacroOverVisualRange()<cr>

" treat long lines as break lines
" (useful when moving around in them)
	nnoremap j gj
	nnoremap k gk

	nnoremap Q gq
	vnoremap Q gq

" reasonable mappings to open paths
	nnoremap <C-W>gf gf
	nnoremap gf <C-W>gf

" set . to always work via normal mode
xnoremap <silent> . :normal .<cr>

" [Command lines]
augroup command_line | au!
	au CmdWinEnter * nnoremap <buffer> <S-CR> <CR>
	au CmdWinEnter * nnoremap <buffer> <CR>   <CR>
	au CmdWinEnter * nnoremap <buffer> <ESC> <C-C>
augroup END

" reasonable mappings to move between windows
	" tnoremap <ESC> <C-\><C-n>
	tnoremap <C-w>h <C-\><C-n><C-w>h
	tnoremap <C-w>j <C-\><C-n><C-w>j
	tnoremap <C-w>k <C-\><C-n><C-w>k
	tnoremap <C-w>l <C-\><C-n><C-w>l
	tmap <C-h> <C-w>h
	tmap <C-j> <C-w>j
	tmap <C-k> <C-w>k
	tmap <C-l> <C-w>l
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

" toggle line wrap
	nnoremap <silent> <leader>lw :set wrap!<CR>

" substitute
	vnoremap si :s//gc<LEFT><LEFT><LEFT>
	vnoremap ss "hy:%s/<C-r>h//gc<LEFT><LEFT><LEFT>

" search setup:
	vmap <Plug>N N

" toggle orthography
	nmap <silent> <leader>o :setlocal spell!<CR>

" tab setup:
	nnoremap <M-1> 1gt
	nnoremap <M-2> 2gt
	nnoremap <M-3> 3gt
	nnoremap <M-4> 4gt
	nnoremap <M-5> 5gt
	nnoremap <M-6> 6gt
	nnoremap <M-7> 7gt
	nnoremap <M-8> 8gt
	nnoremap <M-9> 9gt
	nnoremap <M-0> 10gt
	inoremap <M-1> <C-O>1gt
	inoremap <M-2> <C-O>2gt
	inoremap <M-3> <C-O>3gt
	inoremap <M-4> <C-O>4gt
	inoremap <M-5> <C-O>5gt
	inoremap <M-6> <C-O>6gt
	inoremap <M-7> <C-O>7gt
	inoremap <M-8> <C-O>8gt
	inoremap <M-9> <C-O>9gt
	inoremap <M-0> <C-O>10gt

" Debugging setup:
	nmap <leader>b :BreakpointToggle<CR>

" Util setup:
	nmap <silent> <leader>rf :read !find -name ''<LEFT>
	nmap <silent> <leader>rsf :read !find -regextype sed -regex '.*\.\(h\\|hh\\|hpp\\|c\\|cc\\|cpp\\|cxx\\|s\\|S\)$' \| sort<CR>
	nmap <silent> <leader>rsd :read !find -type d -name '*' \| sort<CR>
	nmap <silent> <leader>x  :wa! \| !%<CR>
	nmap <silent> <leader>mx :wa! \| !chmod +x %<CR>
	nmap <silent> <leader>mt :wa! \| !clear; ctags --exclude=.git --exclude='*.log' -R * <CR>

" Check file in shellcheck:
	" nmap <leader>shc :wa! \| !shellcheck %<CR>

" Makefile setup:
	nmap <silent> <leader>ma :wa! \| !clear; time make<CR>
	nmap <silent> <leader>mc :wa! \| !clear; time make clean<CR>
	nmap <silent> <leader>mf :wa! \| !clear; time make flash<CR>
	nmap <silent> <leader>ms :wa! \| !clear;      make serial<CR>
	nmap <silent> <leader>mv :wa! \| !clear;      make vcp<CR>

" git setup:
	nmap <silent> <leader>gs  :gstatus<CR>

" Open corresponding .pdf/.html or preview
	nmap <silent> <leader>p :!opout <c-r>%<CR><CR>

" Swap bettween hex and plain text views
	nmap <silent> <leader>h :call ToggleHexView()<CR>
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

" ib = inner buffer
onoremap ib :exec "normal! ggVG"<cr>
" iv = current viewable text in the buffer
onoremap iv :exec "normal! HVL"<cr>

" reasonable
nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <expr> k (v:count > 1 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : "") . 'j'

nnoremap <silent> <M-S-h> @='xhP'<CR>
nnoremap <silent> <M-S-j> :m .+1<CR>
nnoremap <silent> <M-S-k> :m .-2<CR>
nnoremap <silent> <M-S-l> @='xp'<CR>

vnoremap <silent> <M-S-h> @='xhPgvhoho'<CR>
vnoremap <silent> <M-S-j> :m '>+1<CR>gv
vnoremap <silent> <M-S-k> :m '<-2<CR>gv
vnoremap <silent> <M-S-l> @='xpgvolol'<CR>

inoremap <silent> <M-S-j> <C-o>:m .+1<CR>
inoremap <silent> <M-S-k> <C-o>:m .-2<CR>

inoremap  ,  ,<c-g>u
inoremap  .  .<c-g>u
inoremap  !  !<c-g>u
inoremap  ?  ?<c-g>u
inoremap  (  (<c-g>u
inoremap  )  )<c-g>u
inoremap  [  [<c-g>u
inoremap  ]  ]<c-g>u
inoremap  {  {<c-g>u
inoremap  }  }<c-g>u
inoremap  <  <<c-g>u
inoremap  >  ><c-g>u
inoremap  "  "<c-g>u
inoremap  '  '<c-g>u
inoremap  `  `<c-g>u
inoremap  +  +<c-g>u
inoremap  -  -<c-g>u
inoremap  *  *<c-g>u
inoremap  /  /<c-g>u
inoremap  %  %<c-g>u
inoremap  =  =<c-g>u
inoremap \| \|<c-g>u
inoremap  &  &<c-g>u
inoremap  ^  ^<c-g>u
inoremap  @  @<c-g>u
inoremap  ~  ~<c-g>u
inoremap  $  $<c-g>u
inoremap  #  #<c-g>u
inoremap  ;  ;<c-g>u
inoremap  :  :<c-g>u

nnoremap <silent> <leader>co <CMD>copen<CR>
nnoremap <silent> <leader>cc <CMD>cclose<CR>
nnoremap <silent> <leader>cn <CMD>cnext<CR>
nnoremap <silent> <leader>cp <CMD>cprev<CR>
nnoremap <silent> <leader>lo <CMD>lopen<CR>
nnoremap <silent> <leader>lc <CMD>lclose<CR>
nnoremap <silent> <leader>ln <CMD>lnext<CR>
nnoremap <silent> <leader>lp <CMD>lprev<CR>
