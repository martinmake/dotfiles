call plug#begin('~/.config/nvim/plugged')
" code related
Plug 'tpope/vim-commentary'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'tikhomirov/vim-glsl'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'luochen1990/rainbow'
Plug 'bfrg/vim-cpp-modern'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'vhdirk/vim-cmake'
Plug 'pboettch/vim-cmake-syntax'
Plug 'sirtaj/vim-openscad'
" Plug 'vim-scripts/Conque-GDB'

" code unrelated
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
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

" only R
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

let mapleader =" "

" Some basics:
	set nocompatible
	filetype off
	filetype plugin on
	set encoding=utf-8
	set number relativenumber
	set splitbelow splitright
	hi SignColumn ctermbg=none
	hi SpellBad   ctermfg=none
	hi Error      ctermfg=none
	hi Visual     ctermfg=none
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
" Tabs setup:
	set shiftwidth=4
	set tabstop=4
	set softtabstop=0
	set noexpandtab
	set smarttab
" Insert mode newbie hell:
	imap <UP>    <NOP>
	imap <DOWN>  <NOP>
	imap <LEFT>  <NOP>
	imap <RIGHT> <NOP>
	nmap <UP>    <NOP>
	nmap <DOWN>  <NOP>
	nmap <LEFT>  <NOP>
	nmap <RIGHT> <NOP>
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
	" tnoremap <Esc> <C-\><C-n>
	" autocmd TermOpen * startinsert
" Random setup:
	let g:python3_host_prog='/usr/bin/python'
	map <leader>lw :set wrap!<CR>
" Autocompletion setup:
	let g:ycm_autoclose_preview_window_after_completion=1
	let g:ycm_min_num_of_chars_for_completion=1
	let g:ycm_auto_trigger=1
	let g:ycm_max_diagnostics_to_display=0
	let g:ycm_collect_identifiers_from_comments_and_strings=1
	let g:ycm_add_preview_to_completeopt=1
	let g:ycm_seed_identifiers_with_syntax=1
	let g:ycm_use_ultisnips_completer=1
	let g:ycm_use_clangd=1
	let g:ycm_clangd_binary_path='/usr/bin/clangd'
	let g:ycm_clangd_args=['-Wno-switch-bool']
	hi YcmWarningSection ctermfg=yellow cterm=bold,reverse
	hi YcmWarningSign    ctermfg=yellow cterm=bold,reverse
	hi YcmErrorSection   ctermfg=red    cterm=bold,reverse
	hi YcmErrorSign      ctermfg=red    cterm=bold,reverse
	map <leader>yr   :YcmRestartServer<CR>
	map <leader>gdef :YcmCompleter GoToDefinition<CR>
	map <leader>gdec :YcmCompleter GoToDeclaration<CR>
	map <leader>gi   :YcmCompleter GoToInclude<CR>
	map <leader>gdoc :YcmCompleter GetDoc<CR>
	map <leader>gt   :YcmCompleter GetType<CR>
	map <leader>f    :YcmCompleter FixIt<CR>
" generic highlight setup:
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
	nnoremap ? /\c
	nmap *   <Plug>(asterisk-*)  <Plug>(searchhi-update)
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
	vmap n   <Plug>(searchhi-v-n)
	vmap N   <Plug>(searchhi-v-N)
	vmap *   <Plug>(searchhi-v-*)
	vmap g*  <Plug>(searchhi-v-g*)
	vmap #   <Plug>(searchhi-v-#)
	vmap g#  <Plug>(searchhi-v-g#)
	vmap gd  <Plug>(searchhi-v-gd)
	vmap gD  <Plug>(searchhi-v-gD)
	nmap / <Plug>(searchhi-/)
	" nmap ? <Plug>(searchhi-?)
	vmap / <Plug>(searchhi-v-/)
	" vmap ? <Plug>(searchhi-v-?)
	nmap <silent> <C-s> <Plug>(searchhi-clear-all)
	vmap <silent> <C-s> <Plug>(searchhi-v-clear-all)
	let g:searchhi_user_autocmds_enabled=1
	let g:searchhi_redraw_before_on     =1
	augroup searchhi
	    autocmd!
	    autocmd User SearchHiOn AnzuUpdateSearchStatusOutput
	    autocmd User SearchHiOff echo g:anzu_no_match_word
	augroup END
	highlight Search        ctermbg=none cterm=reverse,bold
	highlight CurrentSearch ctermbg=none cterm=bold,underline
" multi-cursor setup:
	let g:multi_cursor_use_default_mapping=0
	let g:multi_cursor_start_word_key     ='<C-n>'
	let g:multi_cursor_select_all_word_key='<A-n>'
	let g:multi_cursor_start_key          ='g<C-n>'
	let g:multi_cursor_select_all_key     ='g<A-n>'
	let g:multi_cursor_next_key           ='<C-n>'
	let g:multi_cursor_prev_key           ='<C-p>'
	let g:multi_cursor_skip_key           ='<C-x>'
	let g:multi_cursor_quit_key           ='<Esc>'
" resize setup:
	map <LEFT>  :<C-U>ObviousResizeLeft<CR>
	map <DOWN>  :<C-U>ObviousResizeDown<CR>
	map <UP>    :<C-U>ObviousResizeUp<CR>
	map <RIGHT> :<C-U>ObviousResizeRight<CR>
	let g:obvious_resize_run_tmux = 1

" cmake fix:
	autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt RainbowToggle

" pandoc setup:
	autocmd BufRead,BufNewFile ~/Documents/school*.md set filetype=markdown.pandoc
	highlight FoldColumn ctermfg=magenta ctermbg=none cterm=none
	highlight Conceal    ctermfg=red     ctermbg=none cterm=bold

" Goyo plugin makes text more readable when writing prose:
	map <leader>\ :Goyo \| set bg=light \| set linebreak<CR>

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

" Util setup:
	nmap <leader>w  :wa!<CR>
	nmap <leader>x  :wa! \| !./%<CR>
	nmap <leader>mx :wa! \| !chmod +x %<CR>
	nmap <leader>rs :wa! \| read !
	nmap <leader>mt :wa! \| !clear; ctags --exclude=.git --exclude='*.log' -R * <CR>

" Check file in shellcheck:
	map <leader>sc :wa! \| !shellcheck %<CR>

" Makefile setup:
	nmap <leader>ma :wa! \| !clear; (time make NO_DEBUG=FALSE) \| grep "^$(printf '\t')*[<>\*]"<CR>
	nmap <leader>mp :wa! \| !clear; (time make NO_DEBUG=TRUE ) \| grep "^$(printf '\t')*[<>\*]"<CR>
	nmap <leader>ml :wa! \| !clear; (time make NO_DEBUG=FALSE)<CR>
	nmap <leader>mc :wa! \| !clear; (time make clean  NO_DEPENDENCIES=TRUE) \| grep "^$(printf '\t')\?[<>\*]"<CR>
	nmap <leader>mf :wa! \| !clear; (time make flash  NO_DEPENDENCIES=TRUE)<CR>
	nmap <leader>ms :wa! \| !clear; (     make serial NO_DEPENDENCIES=TRUE)<CR>
	nmap <leader>mv :wa! \| !clear; (     make vcp    NO_DEPENDENCIES=TRUE)<CR>
	nmap <leader>mb :wa! \| !clear; (     make bear                       )<CR>:YcmRestartServer<CR>
	" nmap <leader>ma  :wa! \| terminal (time make NO_DEBUG=FALSE) \| grep "^$(printf '\t')*[<>\*]"<CR>
	" nmap <leader>mp  :wa! \| terminal (time make NO_DEBUG=TRUE ) \| grep "^$(printf '\t')*[<>\*]"<CR>
	" nmap <leader>ml  :wa! \| terminal (time make NO_DEBUG=FALSE)<CR>
	" nmap <leader>mc  :wa! \| !(time make clean  NO_DEPENDENCIES=TRUE) \| grep "^$(printf '\t')\?[<>\*]"<CR>
	" nmap <leader>mf  :wa! \| !time make flash  NO_DEPENDENCIES=TRUE<CR>
	" nmap <leader>ms  :wa! \| terminal make serial NO_DEPENDENCIES=TRUE<CR>
	" nmap <leader>mt  :wa! \| silent !make tags NO_DEPENDENCIES=TRUE<CR>
	" nmap <leader>mb  :wa! \| silent !make bear<CR>:YcmRestartServer<CR>

" git setup:
	map <leader>gs  :Gstatus<CR>
	map <leader>gpl :Gstatus<CR>
	map <leader>gps :Gstatus<CR>

" gdb setup:
	let g:ConqueTerm_Color        =2
	let g:ConqueTerm_CloseOnEnd   =1
	let g:ConqueTerm_StartMessages=0

" R setup:
	command RStart let oldft=&ft | set ft=r | exe 'set ft='.oldft | let b:IsInRCode=function("DefaultIsInRCode") | normal <LocalLeader>rf
	let R_assign=0
	let g:rout_follow_colorscheme=1
	let g:rout_more_colors=1
	                   let g:ale_enabled=0
	autocmd Filetype r let g:ale_enabled=1
	autocmd Filetype r RStart
	autocmd Filetype r nmap , \l<CR>
	autocmd Filetype r vmap , \ss<ESC><CR>
	autocmd Filetype r call ncm2#enable_for_buffer()
	au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
	au User Ncm2PopupClose set completeopt=menuone
	set shortmess+=c
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	autocmd Filetype r let g:ncm2#auto_popup=1
	autocmd Filetype r let g:ncm2#matcher="substrfuzzy"
	let g:ycm_filetype_blacklist={ 'r': 1 }

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Ensure files are read as what I want:
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man,*.tmac set filetype=groff
	autocmd BufRead,BufNewFile *.wiki set filetype=vimwiki

" Enable Goyo by default for mutt writting
	" Goyo's width will be the line limit in mutt.
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=light

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Forcing syntax
	autocmd BufRead,BufNewFile *.vs,*.fs,*.shader :set ft=glsl

" MARKDOWN
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

" rainbow setup:
let g:rainbow_active=1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf={
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,\|=\|+\|\*\|-\|\.\|;\||\|&\|?\|:\|::\|<\|>\|%\|/[^/]_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
