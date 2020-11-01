let g:startify_fortune_use_unicode = 1

" let startify_custom_header = system("cat '".g:vim_plugin_options_directory."/vim-startify.txt'")
let startify_custom_header = ''

let g:startify_custom_header =
	\ map(split(startify_custom_header, '\n'), 'repeat(" ", 10) . v:val')
