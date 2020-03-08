call plug#begin('~/.config/vim/plugged')
	" code related
	Plug 'tpope/vim-commentary'
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'tikhomirov/vim-glsl'
	Plug 'vim-scripts/indentpython.vim'
	Plug 'vim-scripts/DoxygenToolkit.vim'
	Plug 'luochen1990/rainbow'
	Plug 'bfrg/vim-cpp-modern'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'vhdirk/vim-cmake'
	Plug 'pboettch/vim-cmake-syntax'
	Plug 'sirtaj/vim-openscad'
	Plug 'HugoNikanor/vim-breakpoint'
	Plug 'bkad/CamelCaseMotion'
	Plug 'ericcurtin/CurtineIncSw.vim'

	" code unrelated
	Plug 'tpope/vim-surround'
	Plug 'scrooloose/nerdtree'
	Plug 'jreybert/vimagit'
	Plug 'vimwiki/vimwiki'
	Plug 'vifm/vifm.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'wincent/terminus'
	Plug 'chrisbra/csv.vim'
	Plug 'osyo-manga/vim-anzu'
	Plug 'qxxxb/vim-searchhi'
	Plug 'haya14busa/vim-asterisk'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'bling/vim-airline'
	Plug 'vim-pandoc/vim-pandoc'
	Plug 'vim-pandoc/vim-pandoc-syntax'
	Plug 'mzlogin/vim-markdown-toc'
	Plug 'talek/obvious-resize'
	Plug 'thinca/vim-visualstar'
	Plug 'easymotion/vim-easymotion'
	Plug 'justinmk/vim-sneak'

	" autocomplete
	Plug 'ycm-core/YouCompleteMe'
	Plug 'honza/vim-snippets'
	Plug 'sirver/UltiSnips'

	" R
	Plug 'jalvesaq/Nvim-R'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	Plug 'gaalcaras/ncm-R'
	Plug 'ncm2/ncm2'
	Plug 'ncm2/ncm2-ultisnips'
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
	Plug 'w0rp/ale'
call plug#end()

let mapleader=" "

" Some basics:
    map <ESC> :nohlsearch<CR>
	set nocompatible
	filetype off
	filetype plugin on
	set encoding=utf-8
	set number relativenumber
	set splitbelow splitright
	highlight SignColumn ctermbg=none
	highlight SpellBad   ctermfg=none
	highlight Error      ctermfg=none
	highlight Visual     ctermfg=none
	syntax on
	set hlsearch
	nnoremap S :%s//g<Left><Left>
	vnoremap S :s//g<Left><Left>
	set wildmode=list:longest,full
	set wildmenu
	set wildignorecase
	set bg=light
	set mouse=a
	set path+=**
	set clipboard=unnamedplus
	set exrc
    tnoremap <leader><ESC> <C-\><C-n>
" Tabs setup:
	set shiftwidth=4
	set tabstop=4
	set softtabstop=0
	set noexpandtab
	set smarttab
" Newbie hell:
	imap <UP>    <NOP>
	imap <DOWN>  <NOP>
	imap <LEFT>  <NOP>
	imap <RIGHT> <NOP>
	nmap <UP>    <NOP>
	nmap <DOWN>  <NOP>
	nmap <LEFT>  <NOP>
	nmap <RIGHT> <NOP>
	nmap <h> <NOP>
	nmap <j> <NOP>
	nmap <k> <NOP>
	nmap <l> <NOP>
" Shortcutting split navigation:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
" Folding setup:
	set foldmethod=indent
	set foldlevel=99
	highligh Folded ctermbg=none
	map <leader><leader> za
" Auto brackets
	inoremap {<CR> <CR>{<CR>}<ESC>O
	inoremap {; <CR>{<CR>};<ESC>O
" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+P
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Terminal setup:
	if (has('nvim'))
		tnoremap <Esc> <C-\><C-n>
		autocmd TermOpen * startinsert
	endif
" Random setup:
	let g:python3_host_prog='/usr/bin/python'
	map <leader>lw :set wrap!<CR>
" switch source to include and vice versa:
	map <C-s> :call CurtineIncSw()<CR>
" sneak setup:
	highlight Sneak      cterm=reverse
	highlight SneakScope cterm=reverse
	let g:sneak#s_next=1
	map s s
	" repeat motion
	map ; <Plug>Sneak_;
	map , <Plug>Sneak_,
	" 1-character enhanced 'f'
		nmap f <Plug>Sneak_f
		nmap F <Plug>Sneak_F
		" visual-mode
		xmap f <Plug>Sneak_f
		xmap F <Plug>Sneak_F
		" operator-pending-mode
		omap f <Plug>Sneak_f
		omap F <Plug>Sneak_F
	" 1-character enhanced 't'
		nmap t <Plug>Sneak_t
		nmap T <Plug>Sneak_T
		" visual-mode
		xmap t <Plug>Sneak_t
		xmap T <Plug>Sneak_T
		" operator-pending-mode
		omap t <Plug>Sneak_t
		omap T <Plug>Sneak_T
" Identificator motion:
	map <silent> w <Plug>CamelCaseMotion_w
	map <silent> b <Plug>CamelCaseMotion_b
	map <silent> e <Plug>CamelCaseMotion_e
	map <silent> ge <Plug>CamelCaseMotion_ge
	sunmap w
	sunmap b
	sunmap e
	sunmap ge
	omap <silent> iw <Plug>CamelCaseMotion_iw
	xmap <silent> iw <Plug>CamelCaseMotion_iw
	omap <silent> ib <Plug>CamelCaseMotion_ib
	xmap <silent> ib <Plug>CamelCaseMotion_ib
	omap <silent> ie <Plug>CamelCaseMotion_ie
	xmap <silent> ie <Plug>CamelCaseMotion_ie
" splitting line:
	set fillchars+=vert:\┃
	highligh VertSplit ctermfg=81 ctermbg=none cterm=bold
" generic highlight setup:
	highlight DiffAdd      ctermfg=green       ctermbg=none     cterm=bold
	highlight DiffDelete   ctermfg=red         ctermbg=none     cterm=bold
	highlight DiffChange   ctermfg=white       ctermbg=none     cterm=italic
	highlight DiffText     ctermfg=red         ctermbg=none     cterm=bold
	highlight Comment      ctermfg=darkGreen   ctermbg=none     cterm=italic
	highlight SpellBad                         ctermbg=red      cterm=bold
	highlight Constant     ctermfg=red         ctermbg=none     cterm=none
	highlight Normal       ctermfg=white       ctermbg=none     cterm=none
	highlight Visual                           ctermbg=darkGray cterm=bold
	highlight NonText      ctermfg=black       ctermbg=none     cterm=none
	highlight Special      ctermfg=darkMagenta ctermbg=none     cterm=none
	highlight Cursor       ctermfg=green       ctermbg=none     cterm=none
	highlight Structure    ctermfg=lightGreen  ctermbg=none     cterm=none
	highlight Type         ctermfg=lightGreen  ctermbg=none     cterm=none
	highlight Keyword      ctermfg=darkCyan    ctermbg=none     cterm=none
	highlight Conditional  ctermfg=darkCyan    ctermbg=none     cterm=none
	highlight Statement    ctermfg=lightBlue   ctermbg=none     cterm=none
	highlight TODO         ctermfg=lightBlue   ctermbg=none     cterm=reverse,bold
	highlight Pmenu        ctermfg=lightBlue   ctermbg=none     cterm=none
	highlight PmenuSel     ctermfg=lightBlue   ctermbg=none     cterm=reverse,bold
	highlight PmenuSbar    ctermfg=lightBlue   ctermbg=none     cterm=none
	highlight PmenuThumb   ctermfg=lightBlue   ctermbg=none     cterm=reverse
	highlight LineNr       ctermfg=lightBlue   ctermbg=none     cterm=none
	highlight CursorLineNr ctermfg=blue        ctermbg=none     cterm=bold
	highlight WildMenu     ctermfg=lightBlue   ctermbg=none     cterm=reverse,bold
	highlight StatusLine   ctermfg=lightBlue   ctermbg=none     cterm=none
	highlight TabLine      ctermfg=white       ctermbg=none     cterm=none
	highlight TabLineSel   ctermfg=lightBlue   ctermbg=none     cterm=reverse,bold
	highlight TabLineFill  ctermfg=none        ctermbg=none     cterm=none
	highlight ColorColumn  ctermfg=red         ctermbg=black    cterm=bold
	highlight OverLength   ctermfg=red         ctermbg=none     cterm=bold
	match OverLength /\%81v.*/
	set textwidth=80
	set colorcolumn=+1
	nmap <leader>lt :call ToggleLimitText()<CR>
	let g:is_limit_text=1
	function! ToggleLimitText()
		if g:is_limit_text
			let g:is_limit_text=0
			highlight ColorColumn none
			highlight OverLength  none
		else
			let g:is_limit_text=1
			highlight ColorColumn  ctermfg=red         ctermbg=black    cterm=bold
			highlight OverLength   ctermfg=red         ctermbg=none     cterm=bold
		endif
	endfunction
" commenting setup:
	autocmd FileType c,cpp,cuda     setlocal commentstring=//\ %s
	autocmd FileType python,sh,make setlocal commentstring=#\ %s
	autocmd FileType vim            setlocal commentstring=\"\ %s
	nmap <C-c> gcc
	vmap <C-c> gc
" search setup:
	map  <Leader>  <Plug>(easymotion-prefix)
	map  ml <Plug>(easymotion-bd-jk)
	nmap ml <Plug>(easymotion-overwin-line)
	map  mw <Plug>(easymotion-bd-w)
	nmap mw <Plug>(easymotion-overwin-w)
	map  / <Plug>(easymotion-sn)
	omap / <Plug>(easymotion-tn)
	map  n <Plug>(easymotion-next)
	map  N <Plug>(easymotion-prev)
	let g:EasyMotion_smartcase = 1
	nmap *   <Plug>(asterisk-*)
	nmap #   <Plug>(asterisk-#)  <Plug>(searchhi-update)
	nmap g*  <Plug>(asterisk-g*) <Plug>(searchhi-update)
	nmap g#  <Plug>(asterisk-g#) <Plug>(searchhi-update)
	nmap z*  <Plug>(asterisk-z*) <Plug>(searchhi-update)
	nmap z#  <Plug>(asterisk-z#) <Plug>(searchhi-update)
	nmap gz* <Plug>(asterisk-gz*)<Plug>(searchhi-update)
	nmap gz# <Plug>(asterisk-gz#)<Plug>(searchhi-update)
	nmap n   <Plug>(searchhi-n)
	nmap N   <Plug>(searchhi-N)
	nmap #   <Plug>(searchhi-#)
	nmap gd  <Plug>(searchhi-gd)
	nmap gD  <Plug>(searchhi-gD)
	vnoremap <Plug>N N
	vmap * <Plug>(visualstar-*)<Plug>N
	vmap # <Plug>(visualstar-#)<Plug>N
	" nmap <silent> <C-s> <Plug>(searchhi-clear-all)
	" vmap <silent> <C-s> <Plug>(searchhi-v-clear-all)
	let g:searchhi_user_autocmds_enabled=1
	let g:searchhi_redraw_before_on=1
	augroup searchhi
		autocmd!
		autocmd User SearchHiOn AnzuUpdateSearchStatusOutput
		autocmd User SearchHiOff echo g:anzu_no_match_word
	augroup END
	highlight Search        ctermbg=none cterm=reverse,bold
	highlight CurrentSearch ctermbg=none cterm=bold,underline
" multi-cursor setup:
	let g:multi_cursor_use_default_mapping=0
	let g:multi_cursor_exit_from_visual_mode=1
	" let g:multi_cursor_start_word_key     =''
	" let g:multi_cursor_select_all_word_key=''
	let g:multi_cursor_start_key          ='<C-N>'
	let g:multi_cursor_select_all_key     ='<leader>r'
	let g:multi_cursor_next_key           ='<C-N>'
	let g:multi_cursor_prev_key           ='<C-P>'
	let g:multi_cursor_skip_key           ='<C-S>'
	let g:multi_cursor_quit_key           ='<Esc>'

" jump movement setup:
	noremap <C-F> <C-I>
	noremap <C-B> <C-O>

" resize setup:
    map <C-Y> :<C-U>ObviousResizeLeft<CR>
    map <C-U> :<C-U>ObviousResizeDown<CR>
    map <C-I> :<C-U>ObviousResizeUp<CR>
    map <C-O> :<C-U>ObviousResizeRight<CR>

" cmake fix:
	autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt RainbowToggle

" pandoc setup:
	autocmd BufRead,BufNewFile ~/Documents/school*.md set filetype=markdown.pandoc
	highlight FoldColumn ctermfg=magenta ctermbg=none cterm=none
	highlight Conceal    ctermfg=red     ctermbg=none cterm=bold

" Spell-check set to <leader>o, 'o' for 'orthography':
	set spellfile=$HOME/.vim/spell/en.utf-8.add
	set spelllang=en_us
	map <leader>o :setlocal spell!<CR>

" Nerd tree setup:
	map <leader>t :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Vimwiki setup:
	autocmd FileType vimwiki nmap <leader>i :VimwikiIncrementListItem<CR>
	autocmd FileType vimwiki nmap <leader>d :VimwikiDecrementListItem<CR>

" FZF setup:
	nmap <leader>ff :wa! \| FZF<CR>
	nmap <leader>fh :wa! \| FZF ~<CR>
	nmap <leader>fg :wa! \| FZF /<CR>
	nmap <leader>fu :wa! \| FZF /usr<CR>

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

" gdb setup:
	let g:ConqueTerm_Color        =2
	let g:ConqueTerm_CloseOnEnd   =1
	let g:ConqueTerm_StartMessages=0

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Swap bettween hex and plain text views
	nmap <leader>h :call SwapBetweenHexAndPlainTextView()<CR>
	let g:is_plain_text_view=1
	function! SwapBetweenHexAndPlainTextView ()
		if g:is_plain_text_view
			let g:is_plain_text_view=0
			%!xxd
		else
			let g:is_plain_text_view=1
			%!xxd -r
		endif
	endfunction

" Ensure files are read as what I want:
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man,*.tmac set filetype=groff
	autocmd BufRead,BufNewFile *.wiki set filetype=vimwiki

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Forcing syntax
	autocmd BufRead,BufNewFile *.vs,*.fs,*.shader :set ft=glsl

" .lst file settings
	function! Reading_lstfile()
		if g:is_limit_text
			call ToggleLimitText()
		endif
		ALEDisable
		set nowrap
		set noswapfile
		set nofoldenable
		set bufhidden=unload
		set foldmethod=manual
		set complete=
		set nobackup
		set nowritebackup
		set undolevels=-1
	endfunction
	autocmd BufReadPre *.lst call Reading_lstfile()

if !has('nvim') | echohl WarningMsg \
  | echo "Neovim isn't available, running vim..." | echohl None | endif

let modules = glob('~/.config/vim/rc/module-options/*.vim')
for file in split(modules, '\n') | execute 'source ' . file | endfor
