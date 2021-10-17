" make sure plug is installed {{{
	if !filereadable(g:vim_autoload_directory.'/plug.vim') && executable('curl')
		let s:vimplug_link='https://raw.githubusercontent.com/junegunn/'
			\.'vim-plug/master/plug.vim'
		execute 'silent !curl -fLo '.g:vim_config_directory
			\.'/autoload/plug.vim --create-dirs '.s:vimplug_link
	endif
" }}}
call plug#begin(g:vim_plugin_directory) " {{{
" 	TODO: sort these plugins {{{
	Plug 'https://github.com/tpope/vim-projectionist'
	au User vim-dispatch-neovim call DispatchAddNeovim()
" 	}}}
" 	internal improvement {{{
	Plug 'https://github.com/junegunn/vim-plug'
	Plug 'https://github.com/vim-scripts/cmdalias.vim'
	silent! call plug#load('cmdalias.vim')
	Plug 'https://github.com/tpope/vim-repeat'
	Plug 'https://github.com/tpope/vim-speeddating'
	Plug 'https://github.com/tweekmonster/startuptime.vim'
		\, { 'on': 'StartupTime' }
	Plug 'https://github.com/romainl/vim-qf'
	Plug 'https://github.com/mhinz/vim-hugefile'
	Plug 'https://github.com/airblade/vim-rooter'
	Plug 'https://github.com/kopischke/vim-stay'
	Plug 'https://github.com/csexton/trailertrash.vim'
	Plug 'https://github.com/MarcWeber/vim-addon-local-vimrc'
	Plug 'https://github.com/wincent/terminus'
	" Plug 'https://github.com/ervandew/supertab'
	Plug 'https://github.com/powerman/vim-plugin-viewdoc'
		\, { 'on': ['ViewDocHelp', 'ViewDoc', 'ViewDocMan'] }
	Plug 'https://github.com/glts/vim-magnum'
	Plug 'https://github.com/talek/obvious-resize'
	Plug 'https://github.com/mhinz/vim-startify'
	Plug 'https://github.com/kana/vim-textobj-user'
	Plug 'https://github.com/nvim-lua/plenary.nvim'
	Plug 'https://github.com/nvim-lua/popup.nvim'
	Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" 	}}}
" 	command extention {{{
	Plug 'https://github.com/easymotion/vim-easymotion'
	Plug 'https://github.com/haya14busa/incsearch.vim'
	Plug 'https://github.com/haya14busa/incsearch-fuzzy.vim'
	Plug 'https://github.com/haya14busa/incsearch-easymotion.vim'

	Plug 'https://github.com/justinmk/vim-sneak'
	Plug 'https://github.com/thinca/vim-visualstar'
	Plug 'https://github.com/osyo-manga/vim-anzu'
	Plug 'https://github.com/haya14busa/vim-asterisk'

	Plug 'https://github.com/chaoren/vim-wordmotion'
	Plug 'https://github.com/tpope/vim-unimpaired'

	Plug 'https://github.com/tpope/vim-commentary'

	Plug 'https://github.com/wellle/targets.vim'
	Plug 'https://github.com/tpope/vim-surround'

	Plug 'https://github.com/jeetsukumaran/vim-indentwise'

	Plug 'https://github.com/svermeulen/vim-cutlass'
	Plug 'https://github.com/svermeulen/vim-yoink'
	Plug 'https://github.com/svermeulen/vim-subversive'
" 	}}}
" 	LSP {{{
	Plug 'https://github.com/neovim/nvim-lspconfig'
	Plug 'https://github.com/tjdevries/lsp_extensions.nvim'
	Plug 'https://github.com/folke/lsp-colors.nvim'
	Plug 'https://github.com/tjdevries/nlua.nvim'
	Plug 'https://github.com/glepnir/lspsaga.nvim'

	Plug 'https://github.com/nvim-lua/completion-nvim'
	Plug 'https://github.com/steelsojka/completion-buffers'
	Plug 'https://github.com/nvim-treesitter/completion-treesitter'
	Plug 'https://github.com/aca/completion-tabnine', { 'do': './install.sh' }
	Plug 'https://github.com/kristijanhusak/completion-tags'
	Plug 'https://github.com/albertoCaroM/completion-tmux'
	Plug 'https://github.com/cbarrete/completion-vcard'
" 	}}}
" 	More power for general editing {{{
	Plug 'https://github.com/tommcdo/vim-exchange'

	" Plug 'https://github.com/Bellaktris/latex-unicoder.vim'
	Plug 'https://github.com/junegunn/vim-easy-align'
		\, { 'on': ['<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)'] }
	Plug 'https://github.com/mtth/scratch.vim'
	Plug 'https://github.com/terryma/vim-multiple-cursors'
" 	}}}
" 	More power for code editing {{{
	Plug 'https://github.com/SirVer/ultisnips'
	Plug 'https://github.com/honza/vim-snippets'

	Plug 'https://github.com/tpope/vim-abolish'
	Plug 'https://github.com/Chiel92/vim-autoformat'
	Plug 'https://github.com/Olical/vim-enmasse' " edit quickfix
		\, { 'on': 'EnMasse' }
	" Plug 'https://github.com/lyuts/vim-rtags'
" 	}}}
" 	documenting {{{
	Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim'
		\, { 'for': ['c', 'cpp', 'sh', 'python'] }
" 	}}}
" 	Fast scripting and making {{{
	Plug 'https://github.com/skywind3000/asyncrun.vim'
		\, {'on': 'AsyncRun'}
	Plug 'https://github.com/tpope/vim-dispatch'
		\, { 'on': ['Make', 'Dispatch'] }
	Plug 'https://github.com/radenling/vim-dispatch-neovim'
		\, { 'on': ['Make', 'Dispatch'] }
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
	Plug 'https://github.com/majutsushi/tagbar'

	Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'https://github.com/junegunn/fzf.vim'
	Plug 'https://github.com/stsewd/fzf-checkout.vim'

	Plug 'https://github.com/nvim-telescope/telescope.nvim'
	Plug 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" 	}}}
" 	Tmux integration {{{
	Plug 'https://github.com/tmux-plugins/vim-tmux-focus-events'
	Plug 'https://github.com/roxma/vim-tmux-clipboard'
" 	}}}
" 	git/diff {{{
	Plug 'https://github.com/mhinz/vim-signify'
	Plug 'https://github.com/will133/vim-dirdiff'
		\, { 'on': [ 'DirDiff' ] }
	Plug 'https://github.com/AndrewRadev/linediff.vim'
		\, { 'on': [ 'LineDiff' ] }
	Plug 'https://github.com/tpope/vim-fugitive'
	Plug 'https://github.com/junegunn/gv.vim'
	Plug 'https://github.com/tpope/vim-rhubarb'
	Plug 'https://github.com/int3/vim-extradite'
" 	}}}
" 	style {{{
	Plug 'https://github.com/luochen1990/rainbow'
	Plug 'https://github.com/groenewege/vim-less'
	Plug 'https://github.com/hail2u/vim-css3-syntax'
	Plug 'https://github.com/ap/vim-css-color'
	command! AddCSSColors call plug#load('vim-css-color')
	Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
		\, {'do': ':TSUpdate'}
	Plug 'https://github.com/nvim-treesitter/playground'
	Plug 'https://github.com/itchyny/lightline.vim'
	Plug 'https://github.com/ncm2/float-preview.nvim'
" 	}}}
" 	autocomplete {{{
	Plug 'https://github.com/jiangmiao/auto-pairs'
	Plug 'https://github.com/tpope/vim-endwise'
" 	}}}
" 	debugging {{{
	Plug 'https://github.com/puremourning/vimspector'
	Plug 'https://github.com/HugoNikanor/vim-breakpoint'
		\, { 'for': ['asm', 'c', 'cpp', 'python'] }
" 	}}}
" 	utilities {{{
	Plug 'https://github.com/szw/vim-maximizer'
	Plug 'https://github.com/mbbill/undotree'
	Plug 'https://github.com/chrisbra/NrrwRgn'
	Plug 'https://github.com/jpalardy/vim-slime'
	Plug 'https://github.com/dbeniamine/cheat.sh-vim'
	Plug 'https://github.com/glts/vim-radical'
	Plug 'https://github.com/junegunn/goyo.vim'
	Plug 'https://github.com/powerman/vim-plugin-AnsiEsc'
		\, { 'on': 'AnsiEsc' }
	Plug 'https://github.com/voldikss/vim-floaterm'
	Plug 'https://github.com/vim-scripts/loremipsum'
" 	}}}

" 	sxhkd {{{
	Plug 'https://github.com/baskerville/vim-sxhkdrc'
		\, { 'for': ['sxhkdrc'] }
" 	}}}
" 	CSV {{{
	Plug 'https://github.com/mechatroner/rainbow_csv'
		\, { 'for': ['csv', 'tsv'] }
	Plug 'https://github.com/chrisbra/csv.vim'
		\, { 'for': ['csv'] }
" 	}}}
" 	LaTeX {{{
	Plug 'https://github.com/lervag/vimtex'
		\, {'for': ['tex'], 'tag': 'v1.6'}
	Plug 'https://github.com/KeitaNakamura/tex-conceal.vim'
		\, {'for': ['tex']}
" 	}}}
" 	Markdown {{{
	Plug 'https://github.com/tpope/vim-markdown'
		\, {'for': ['markdown.pandoc']}
	Plug 'https://github.com/vim-pandoc/vim-pandoc'
		\, { 'for': ['markdown.pandoc'] }
	Plug 'https://github.com/vim-pandoc/vim-pandoc-syntax'
		\, { 'for': ['markdown.pandoc'] }
	Plug 'https://github.com/nelstrom/vim-markdown-folding'
		\, {'for': ['markdown.pandoc']}
" }}}
" 	YAML {{{
	Plug 'https://github.com/pedrohdz/vim-yaml-folds'
		\, {'for': ['yaml']}
" }}}
" 	JavaScript {{{
	Plug 'https://github.com/othree/javascript-libraries-syntax.vim'
		\, {'for': ['js']}
" 	}}}
" 	Haskell {{{
	Plug 'https://github.com/neovimhaskell/haskell-vim'
		\, { 'for': ['haskell'] }
	Plug 'https://github.com/dag/vim2hs'
		\, { 'for': ['haskell'] }
	Plug 'https://github.com/lukerandall/haskellmode-vim'
		\, { 'for': ['haskell'] }
	Plug 'https://github.com/pbrisbin/vim-syntax-shakespeare'
		\, { 'for': ['haskell'] }
" 	}}}
" 	C/C++ {{{
	Plug 'https://github.com/Bellaktris/libview'
	Plug 'https://github.com/bfrg/vim-cpp-modern'
		\, { 'for': ['c', 'cpp'] }
	Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
		\, { 'for': ['cpp'] }
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
" 	OpenSCAD {{{
	Plug 'https://github.com/sirtaj/vim-openscad'
		\, { 'for': ['openscad'] }
" 	}}}
" 	GLSL {{{
	Plug 'https://github.com/tikhomirov/vim-glsl'
		\, { 'for': ['glsl'] }
" 	}}}
call plug#end() " }}}
