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
