let g:vim_config_directory=expand('$XDG_CONFIG_HOME/nvim')
let g:vim_tmp_directory           =g:vim_config_directory.'/tmp'
let g:vim_autoload_directory      =g:vim_config_directory.'/autoload'
let g:vim_spell_directory         =g:vim_config_directory.'/spell'
let g:vim_plugin_directory        =g:vim_config_directory.'/plugged'
let g:vim_plugin_options_directory=g:vim_config_directory.'/plugin-options'
let g:vim_rc_directory            =g:vim_config_directory.'/rc'

if executable('curl') && !filereadable(g:vim_autoload_directory.'/plug.vim')
	let s:vimplug_link='https://raw.githubusercontent.com/junegunn/'
		\.'vim-plug/master/plug.vim'
	execute 'silent !curl -fLo '.g:vim_config_directory
		\.'/autoload/plug.vim --create-dirs '.s:vimplug_link
endif

let g:largefile_trigger_size=0.5

" disable some default plugins
let g:loaded_2html_plugin    = 1
let g:loaded_netrw           = 1
let g:loaded_netrwPlugin     = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_logipat         = 1
let g:loaded_rrhelper        = 1
let g:loaded_vimballPlugin   = 1
let g:python_host_skip_check = 1

call plug#begin(g:vim_plugin_directory)
" 	internal improvement {{{
		Plug 'https://github.com/junegunn/vim-plug'
		Plug 'https://github.com/vim-scripts/cmdalias.vim'
		silent! call plug#load('cmdalias.vim')
" 	}}}
" 	code related {{{
		Plug 'https://github.com/haya14busa/incsearch.vim'
			\, { 'for': ['asm', 'c', 'cpp'] }
		Plug 'https://github.com/tpope/vim-commentary'
" 			\, { 'for': ['c', 'cpp', 'sh', 'python', 'vim', 'unix', 'markdown'] }
" 		Plug 'https://github.com/scrooloose/nerdcommenter' " might be a better option
" 			\, { 'for': ['c', 'cpp', 'python', 'vim', 'unix', 'markdown'] }
		Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim'
			\, { 'for': ['c', 'cpp', 'sh', 'python'] }
		Plug 'https://github.com/HugoNikanor/vim-breakpoint'
			\, { 'for': ['asm', 'c', 'cpp', 'python'] }
" 	}}}
" 	TODO: check out and sort these plugins {{{
" 		Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
" 		Plug 'https://github.com/tpope/vim-repeat'
" 		Plug 'https://github.com/vim-scripts/cecutil'
" 		Plug 'https://github.com/google/vim-maktaba'
" 		Plug 'https://github.com/Shougo/unite.vim'
" 		Plug 'https://github.com/jeetsukumaran/vim-indentwise'
" 		Plug 'https://github.com/coderifous/textobj-word-column.vim'
" 		Plug 'https://github.com/Julian/vim-textobj-brace'
" 		Plug 'https://github.com/kana/vim-textobj-indent'
" 		Plug 'https://github.com/kana/vim-textobj-user'
		Plug 'https://github.com/airblade/vim-rooter'
		Plug 'https://github.com/chaoren/vim-wordmotion'
		Plug 'https://github.com/haya14busa/vim-easyoperator-line'
		Plug 'https://github.com/svermeulen/vim-easyclip'
" 		Plug 'https://github.com/Konfekt/FastFold'
		Plug 'https://github.com/kopischke/vim-stay'
		Plug 'https://github.com/roxma/vim-tmux-clipboard'
		Plug 'https://github.com/haya14busa/incsearch-fuzzy.vim'
		Plug 'https://github.com/powerman/vim-plugin-viewdoc'
			\, { 'on': ['ViewDocHelp', 'ViewDoc', 'ViewDocMan'] }
		Plug 'https://github.com/tpope/vim-dispatch'
			\, { 'on': ['Make', 'Dispatch'] }
		Plug 'https://github.com/radenling/vim-dispatch-neovim'
			\, { 'on': ['Make', 'Dispatch'] }
		au User vim-dispatch-neovim call DispatchAddNeovim()
		Plug 'https://github.com/romainl/vim-qf'
		Plug 'https://github.com/tweekmonster/startuptime.vim'
			\, { 'on': 'StartupTime' }
		Plug 'https://github.com/vim-scripts/Colour-Sampler-Pack'
			\, { 'on': 'COLORSCROLL' }
		Plug 'https://github.com/mhinz/vim-hugefile'
		Plug 'https://github.com/powerman/vim-plugin-AnsiEsc'
			\, { 'on': 'AnsiEsc' }
		Plug 'https://github.com/ap/vim-css-color'
		command! AddCSSColors call plug#load('vim-css-color')
		Plug 'https://github.com/luochen1990/rainbow'
			\, helpers#is_modern() ? {} : { 'on': [] }
		Plug 'https://github.com/othree/javascript-libraries-syntax.vim'
			\, {'for': 'js'}
		Plug 'https://github.com/Bellaktris/vim-hack'
		Plug 'https://github.com/nelstrom/vim-markdown-folding'
			\, {'for': 'markdown'}
		Plug 'https://github.com/artoj/qmake-syntax-vim'
			\, {'for': 'make'}
" 		Plug 'https://github.com/tpope/vim-sleuth' " meh indentation
" 	}}}
" 	Fast scripting and making {{{
		Plug 'https://github.com/Bellaktris/Bexec'
			\, {'on': 'Bexec'}
		Plug 'https://github.com/skywind3000/asyncrun.vim'
			\, {'on': 'AsyncRun'}
		Plug 'https://github.com/johnsyweb/vim-makeshift'
			\, {'on': 'Makeshift'}
" 	}}}
" 	File system and code navigation {{{
		Plug 'https://github.com/scrooloose/nerdtree'
			\, { 'on': ['NERDTreeToggle'] }
		Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
			\, { 'on': ['NERDTreeToggle'] }
		Plug 'https://github.com/Nopik/vim-nerdtree-direnter'
			\, { 'on': ['NERDTreeToggle'] }
		Plug 'https://github.com/dhruvasagar/vim-vinegar'
			\, { 'on': ['NERDTreeToggle'] }
		Plug 'https://github.com/Bellaktris/libview'
		Plug 'https://github.com/majutsushi/tagbar'
		Plug 'https://github.com/mhinz/vim-grepper'
			\, { 'on': 'Grepper' }
		Plug 'https://github.com/Olical/vim-enmasse'
			\, { 'on': 'EnMasse' }
		Plug 'https://github.com/junegunn/fzf.vim'
" 	Plug 'https://github.com/vim-scripts/a.vim' " has hardcoded imap...
" 	}}}
" 	Latex {{{
		Plug 'https://github.com/lervag/vimtex'
			\, {'for': 'tex'}
		Plug 'https://github.com/KeitaNakamura/tex-conceal.vim'
			\, {'for': 'tex'}
" 	}}}
" 	Tmux integration {{{
		Plug 'https://github.com/christoomey/vim-tmux-navigator'
		Plug 'https://github.com/tmux-plugins/vim-tmux-focus-events'
" 	}}}
" 	Git integration {{{
		Plug 'https://github.com/airblade/vim-gitgutter'
		Plug 'https://github.com/jreybert/vimagit'
		Plug 'https://github.com/tpope/vim-fugitive'
		Plug 'https://github.com/tpope/vim-rhubarb'
		Plug 'https://github.com/junegunn/gv.vim'
		Plug 'https://github.com/int3/vim-extradite'
" 	}}}
" 	More power for general editing {{{
		Plug 'https://github.com/Bellaktris/latex-unicoder.vim'
		Plug 'https://github.com/junegunn/vim-easy-align'
			\, { 'on': ['<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)'] }
		Plug 'https://github.com/Bellaktris/vis.vim'
			\, { 'on': ['B', 'S'] }
		Plug 'https://github.com/tommcdo/vim-exchange'
		Plug 'https://github.com/mtth/scratch.vim'
		Plug 'https://github.com/terryma/vim-multiple-cursors'
" 	}}}
" 	More power for code editing {{{
		Plug 'https://github.com/tpope/vim-abolish'
" 		Plug 'https://github.com/lyuts/vim-rtags'
		Plug 'https://github.com/vim-scripts/UltiSnips'
			\, { 'on': [] }
		augroup ultisnips_group | au!
		  au InsertEnter * call plug#load('UltiSnips') | au! ultisnips_group
		augroup END
		Plug 'https://github.com/honza/vim-snippets'
" 	}}}
" 	Syntax checking {{{
		Plug 'https://github.com/neomake/neomake'
			\, { 'on': 'Neomake' }
" 	}}}
" 	Miscelaneus (BAD NAME) {{{
		Plug 'https://github.com/csexton/trailertrash.vim'
		Plug 'https://github.com/Chiel92/vim-autoformat'
		Plug 'https://github.com/MarcWeber/vim-addon-local-vimrc'
" 	}}}
" 	code unrelated (BAD NAME) {{{
		Plug 'https://github.com/vimwiki/vimwiki'
			\, { 'on': ['VimwikiIndex'] }
		Plug 'https://github.com/wincent/terminus'
		Plug 'https://github.com/chrisbra/csv.vim'
			\, { 'for': ['csv'] }
		Plug 'https://github.com/junegunn/goyo.vim'
" 		Plug 'https://github.com/vim-airline/vim-airline'
		Plug 'https://github.com/itchyny/lightline.vim'
		Plug 'https://github.com/vim-pandoc/vim-pandoc'
			\, { 'for': ['markdown.pandoc'] }
		Plug 'https://github.com/vim-pandoc/vim-pandoc-syntax'
			\, { 'for': ['markdown.pandoc'] }
		Plug 'https://github.com/mzlogin/vim-markdown-toc'
			\, { 'for': ['markdown'] }
" 	}}}
"	navigation {{{
		Plug 'https://github.com/talek/obvious-resize'
		Plug 'https://github.com/ctrlpvim/ctrlp.vim'
		Plug 'https://github.com/wesleyche/SrcExpl'
		Plug 'https://github.com/majutsushi/tagbar'
		Plug 'https://github.com/vim-scripts/taglist.vim'
		Plug 'https://github.com/rizzatti/dash.vim'
		Plug 'https://github.com/eugen0329/vim-esearch'
		Plug 'https://github.com/ericcurtin/CurtineIncSw.vim'
		Plug 'https://github.com/mhinz/vim-startify'
" 	}}}
"	command extention {{{
		Plug 'https://github.com/thinca/vim-visualstar'
		Plug 'https://github.com/qxxxb/vim-searchhi'
		Plug 'https://github.com/easymotion/vim-easymotion'
		Plug 'https://github.com/justinmk/vim-sneak'
		Plug 'https://github.com/osyo-manga/vim-anzu'
		Plug 'https://github.com/haya14busa/vim-asterisk'
		Plug 'https://github.com/wellle/targets.vim'
" 		Plug 'https://github.com/tpope/vim-surround'
		Plug 'https://github.com/vim-scripts/repeat.vim'
		Plug 'https://github.com/bkad/CamelCaseMotion'
" 	}}}
" 	autocomplete {{{
" 		Plug 'https://github.com/ycm-core/YouCompleteMe'
" 			\, { 'for': ['c', 'cpp', 'make'] }
		Plug 'https://github.com/neoclide/coc.nvim'
			\, { 'do': { -> coc#util#install()} }
		Plug 'https://github.com/sirver/UltiSnips'
			\, { 'for': ['c', 'cpp', 'make', 'python', 'sh', 'make'] }
		Plug 'https://github.com/jiangmiao/auto-pairs'
" 		Plug 'https://github.com/ervandew/supertab'
		Plug 'https://github.com/tpope/vim-endwise'
" 		Plug 'https://github.com/Yggdroot/indentLine'
" 			\, { 'for': ['python'] }
" 	}}}
" 	utilities {{{
		Plug 'https://github.com/kassio/neoterm'
		Plug 'https://github.com/vifm/vifm.vim'
		Plug 'https://github.com/sjl/gundo.vim'
		Plug 'https://github.com/chrisbra/NrrwRgn'
		Plug 'https://github.com/jpalardy/vim-slime'
		Plug 'https://github.com/dbeniamine/cheat.sh-vim'
" 	}}}
" 	GitHub {{{
		Plug 'https://github.com/junegunn/vim-github-dashboard'
" 	}}}
" 	note taking {{{
		Plug 'https://github.com/xolox/vim-notes'
		Plug 'https://github.com/xolox/vim-misc'
		Plug 'https://github.com/itchyny/calendar.vim'
		Plug 'https://github.com/junegunn/vim-journal'
" 	}}}
" 	CSV {{{
		Plug 'https://github.com/mechatroner/rainbow_csv'
			\, { 'for': ['csv', 'tsv'] }
" 	}}}
" 	Haskell {{{
		Plug 'https://github.com/neovimhaskell/haskell-vim'
			\, { 'for': ['haskell'] }
		Plug 'https://github.com/dag/vim2hs'
			\, { 'for': ['haskell'] }
		Plug 'https://github.com/eagletmt/ghcmod-vim'
			\, { 'for': ['haskell'] }
		Plug 'https://github.com/lukerandall/haskellmode-vim'
			\, { 'for': ['haskell'] }
		Plug 'https://github.com/pbrisbin/vim-syntax-shakespeare'
			\, { 'for': ['haskell'] }
" 	}}}
" 	C/C++ {{{
		Plug 'https://github.com/bfrg/vim-cpp-modern'
			\, { 'for': ['c', 'cpp'] }
" 		Plug 'https://github.com/vim-scripts/vim-lldb'
" 			\, { 'for': ['c', 'cpp'] }
" 		meh plugin
" 		Plug 'https://github.com/quark-zju/vim-cpp-auto-include'
" 			\, { 'for': ['c', 'cpp'] }
		Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
			\, { 'for': ['c', 'cpp'] }
		Plug 'https://github.com/LucHermitte/lh-vim-lib'
			\, { 'for': ['c', 'cpp'] }
		Plug 'https://github.com/LucHermitte/VimFold4C'
			\, { 'for': ['c', 'cpp'] }
" 	}}}
" 	CMake {{{
		Plug 'https://github.com/vhdirk/vim-cmake'
			\, { 'for': ['cmake'] }
		Plug 'https://github.com/pboettch/vim-cmake-syntax'
			\, { 'for': ['cmake'] }
" 	}}}
" 	Python {{{
		Plug 'https://github.com/zchee/deoplete-jedi'
			\, { 'for': ['python'] }
		Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
			\, { 'for': ['python'] }
		Plug 'https://github.com/vim-scripts/indentpython.vim'
			\, { 'for': ['python'] }
" 	}}}
" 	sxkd {{{
		Plug 'https://github.com/baskerville/vim-sxhkdrc'
			\, { 'for': ['sxhkdrc'] }
" 	}}}
" 	OpenSCAD {{{
		Plug 'https://github.com/sirtaj/vim-openscad'
			\, { 'for': ['openscad'] }
" 	}}}
" 	GLSL {{{
		Plug 'https://github.com/tikhomirov/vim-glsl'
			\, { 'for': ['glsl'] }
" 	}}}
" 	R {{{
		Plug 'https://github.com/jalvesaq/Nvim-R'
			\, { 'for': ['R'] }
		Plug 'https://github.com/roxma/nvim-yarp'
			\, { 'for': ['R'] }
		Plug 'https://github.com/gaalcaras/ncm-R'
			\, { 'for': ['R'] }
		Plug 'https://github.com/ncm2/ncm2'
			\, { 'for': ['R'] }
		Plug 'https://github.com/ncm2/ncm2-ultisnips'
			\, { 'for': ['R'] }
		Plug 'https://github.com/ncm2/ncm2-bufword'
			\, { 'for': ['R'] }
		Plug 'https://github.com/ncm2/ncm2-path'
			\, { 'for': ['R'] }
		Plug 'https://github.com/w0rp/ale'
			\, { 'for': ['R'] }
" 	}}}
call plug#end()

" large file settings
" 	let g:largefile_trigger_size=0.5
" 	function! ReadingLargeFile()
" 		if g:is_limit_text
" 			call ToggleLimitText()
" 		endif
" 		ALEDisable
" 		set nowrap
" 		set noswapfile
" 		set nofoldenable
" 		set bufhidden=unload
" 		set foldmethod=manual
" 		set complete=
" 		set nobackup
" 		set nowritebackup
" 		set undolevels=-1
" " 		set eventignore+=FileType
" 		set buftype=nowrite
" 	endfunction
" 	if !exists("large_file_autocommands_loaded")
" 		let large_file_autocommands_loaded=1
" 		augroup LargeFile
" 			autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:largefile_trigger_size | call ReadingLargeFile() | endif
" 			augroup END
" 	endif

execute 'source '.g:vim_rc_directory.'/settings.vim'
execute 'source '.g:vim_rc_directory.'/appearance.vim'
execute 'source '.g:vim_rc_directory.'/mappings.vim'

let plugin_option_files=glob(g:vim_plugin_options_directory.'/*.vim')
for plugin_option_file in split(plugin_option_files, '\n')
	execute 'source '.plugin_option_file
endfor

"=================================================================
" vim:filetype=vim:foldmethod=marker:foldmarker={{{,}}}:foldenable
