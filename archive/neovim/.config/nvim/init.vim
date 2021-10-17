"    ################################################
"
"
"    ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"    ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"    ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"    ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"    ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"    ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"
"
"    ################################################


" stop loading config if it's on tiny or small
if !1 | finish | endif

" paths {{{
	let g:vim_config_directory = expand('$XDG_CONFIG_HOME/nvim')
	let g:vim_data_directory   = expand('$XDG_DATA_HOME/nvim')
	let g:vim_autoload_directory = g:vim_config_directory.'/autoload'
	let g:vim_spell_directory    = g:vim_config_directory.'/spell'
	let g:vim_tmp_directory      = g:vim_data_directory.'/tmp'
	let g:vim_plugin_directory   = g:vim_data_directory.'/plugged'
" }}}
" source configs {{{
	runtime ./rc/plugins.vim
	runtime ./rc/settings.vim
	runtime ./rc/appearance.vim
	runtime ./rc/mappings.vim
" {{{
