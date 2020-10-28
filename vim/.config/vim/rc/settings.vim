"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> enable filetype plugins
"    -> set folding
"    -> extern vimrc's
"    -> persistent undo
"    -> qf windows
"    -> define xtabedit
"    -> [Command Lines]
"    -> clipboard copy/paste
"    -> remove the Windows ^M - when the encodings gets messed up
"    -> wildignore
"    -> use Unix as the standard file type
"    -> set numbers
"    -> set par as vim formatter
"    -> set . to always work via normal mode
"    -> visual @
"    -> treat long lines as break lines
"    -> reasonable mappings to open paths
"    -> reasonable mappings to move between windows
"    -> remember info about open buffers on close
"    -> remember info about open buffers on close
"    -> delete trailing white space on save,
"    -> neovim defaults
"    -> neovim reasonable mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:python3_host_prog='/usr/bin/python'
let g:loaded_ruby_provider=0

" spelling
	set spellfile=$XDG_CONFIG_HOME/nvim/spell/en.utf-8.add
	set spelllang=en_us
set spellcapcheck="[.?!]\_[\])'" \t]\+"

" extern vimrc's
	set secure
	set exrc

" persistent undo
execute 'set undodir='.g:vim_tmp_directory.'/undodir'
set undofile

" :tmpfile
command! Tmpfile :execute 'tabedit '.g:vim_tmp_directory.'/tmpfile'

if !filereadable(g:vim_tmp_directory.'/tmpfile')
	execute 'silent !touch '.g:vim_tmp_directory.'/tmpfile'
endif

if exists(':Alias')
call CmdAlias('tmpfile', 'Tmpfile')
endif


" qf windows
augroup qf | au!
  au QuickFixCmdPost l*    lwindow
  au VimEnter         *    cwindow
  au QuickFixCmdPost [^l]* cwindow
augroup END


" define xtabedit
command! -nargs=1 XTabedit call helpers#open_new_or_existing(<f-args>)

" [Command lines]
augroup command_line | au!
	au CmdWinEnter * nnoremap <buffer> <S-CR> <CR>
	au CmdWinEnter * nnoremap <buffer> <CR>   <CR>
	au CmdWinEnter * nnoremap <buffer> <ESC> <C-C>
augroup END

" use Unix as the standard file type
set fileformats=unix,dos,mac

" wildignore
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
	set wildignore+=.git\*,.hg\*,.svn\*
endif


" set par as vim formatter (outdated!)
" if executable("par")
"     set formatprg=par\ -s0w79rj
" endif


" set . to always work via normal mode
xnoremap <silent> . :normal .<cr>


" visual @
function! ExecuteMacroOverVisualRange()
	ho "@".getcmdline()
	ecute ":'<,'>normal @".nr2char(getchar())
endfunction

xnoremap <silent> @ :<C-u>call ExecuteMacroOverVisualRange()<cr>


" treat long lines as break lines
" (useful when moving around in them)
	nnoremap j gj
	nnoremap k gk

" reasonable mappings to open paths
	nnoremap <C-W>gf gf
	nnoremap gf <C-W>gf

" reasonable mappings to move between windows
	tnoremap <ESC> <C-\><C-N>
	tnoremap <C-W>h <C-\><C-N><C-W>h
	tnoremap <C-W>j <C-\><C-N><C-W>j
	tnoremap <C-W>k <C-\><C-N><C-W>k
	tnoremap <C-W>l <C-\><C-N><C-W>l
	tmap <C-H> <C-W>h
	tmap <C-J> <C-W>j
	tmap <C-K> <C-W>k
	tmap <C-L> <C-W>l

" remember info about open buffers on close
	augroup vimrcs_settings_defaults
		autocmd! BufReadPost *
			 \ if helpers#is_small()
			  \&& line("'\"") > 0
			  \&& line("'\"") <= line("$")
			\|   exe "normal! g`\""
			\| endif
	augroup END


" delete trailing white space on save,
" useful for Python and CoffeeScript ;)
	augroup vimrcs_settings_defaults
		autocmd BufWritePre * %s/\s\+$//e
	augroup END


" make file executable if it contains shebang
	function! MakeExecutable()
		if getline(1) =~ "^#!"
			silent !chmod +x %
		endif
	endfunction

	augroup vimrcs_settings_defaults
		autocmd BufWritePost * call MakeExecutable()
	augroup END

" sudo write
	cmap w! w !sudo tee % >/dev/null


filetype plugin indent on
syntax on
set nobackup
set nowritebackup
set swapfile
set lazyredraw
set ttyfast
set hidden
set noshowmatch
set matchtime=1
set diffopt+=vertical
set noerrorbells
set ignorecase
set smartcase
set noautoread
set virtualedit=all
set backspace=eol,start,indent
set whichwrap+=<,>
set complete-=i
set completeopt=menu,preview
set formatoptions=tcrqn2j
set nomagic
set laststatus=2
set mouse=nr
set nrformats=bin,hex
" set sessionoptions=
set tabpagemax=50
set tags=./tags;,tags
set switchbuf+=usetab,newtab
set nowrap
set nolinebreak
set viewoptions=cursor,folds,slash,unix
set nolangremap
set inccommand=split
set encoding=utf-8
set splitbelow splitright
" internal
	set updatetime=200
	set history=10000
" system
	set shell=$SHELL
	set path+=**
	if $SSH_TTY != ""
		set clipboard=""
	else
		set clipboard=unnamed,unnamedplus
	endif
" wild
	set wildmode=list:longest,full
	set wildmenu
	set wildignorecase

" disable bad mapping
	inoremap <UP>    <NOP>
	inoremap <DOWN>  <NOP>
	inoremap <LEFT>  <NOP>
	inoremap <RIGHT> <NOP>
	nnoremap <UP>    <NOP>
	nnoremap <DOWN>  <NOP>
	nnoremap <LEFT>  <NOP>
	nnoremap <RIGHT> <NOP>

" tabs
	set noexpandtab
	set nosmarttab
	set autoindent
	set smartindent
	set nocindent
	" preproc indent fix
	inoremap # X#

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
