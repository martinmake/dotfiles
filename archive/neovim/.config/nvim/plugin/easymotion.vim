highlight! link EasyMotionIncSearchDefault HighlightText
highlight! link EasyMotionTarget           HighlightText
highlight! link EasyMotionShade            NonMatch
highlight! link EasyMotionMoveHL           Search
highlight! link EasyMotionTarget           Search
highlight! link EasyMotionTarget2First     Search
highlight!      EasyMotionTarget2Second ctermfg=cyan ctermbg=none cterm=bold

let g:EasyMotion_do_mapping        = 0
let g:EasyOperator_line_do_mapping = 0
let g:EasyMotion_enter_jump_first  = 1
let g:EasyMotion_smartcase         = 1
let g:EasyMotion_inc_highlight     = 1
let g:EasyMotion_do_shade          = 0
let g:EasyMotion_use_upper         = 1
let g:EasyMotion_verbose           = 0

let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_prompt = '{n}/'

map gl <Plug>(easymotion-overwin-line)
map gw <Plug>(easymotion-overwin-w)

nmap <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
