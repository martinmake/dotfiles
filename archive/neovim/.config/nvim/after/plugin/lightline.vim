set noshowmode

let g:lightline = {}
let g:lightline.colorscheme = g:colors_name

let g:lightline.component = {}
let g:lightline.component.mode = '%{lightline#mode()}'
let g:lightline.component.absolutepath = '%F'
let g:lightline.component.relativepath = '%f'
let g:lightline.component.filename     = '%t'
let g:lightline.component.modified     = '%M'
let g:lightline.component.bufnum       = '%n'
let g:lightline.component.paste        = '%{&paste?"PASTE":""}'
let g:lightline.component.readonly     = '%R'
let g:lightline.component.charvalue    = '%b'
let g:lightline.component.charvaluehex = '0x%B'
let g:lightline.component.fileencoding = '%{&fenc!=#""?&fenc:&enc}'
let g:lightline.component.fileformat   = '%{&ff}'
let g:lightline.component.filetype     = '%{&ft!=#""?&ft:"no ft"}'
let g:lightline.component.percent      = '%3p%%'
let g:lightline.component.percentwin   = '%P'
let g:lightline.component.spell        = '%{&spell?&spelllang:""}'
let g:lightline.component.lineinfo     = '%3l:%-2v'
let g:lightline.component.line         = '%l'
let g:lightline.component.column       = '%c'
let g:lightline.component.close        = '☭  '
let g:lightline.component.winnr        = '%{winnr()}'
let g:lightline.component.branch       = 'Y %{FugitiveHead()}'

let g:lightline.component_function = {}
let g:lightline.component_function.gitbranch = 'FugitiveHead'

let g:lightline.active = {}
let g:lightline.active.left   = [ [ 'mode'
\                                 , 'paste' ]
\                               , [ 'branch'
\                                 , 'readonly'
\                                 , 'relativepath'
\                                 , 'modified' ] ]
" let g:lightline.active.middle = [ '-------' ]
let g:lightline.active.right  = [ [ 'percent' ]
\                               , [ 'lineinfo' ]
\                               , [ 'charvaluehex'
\                                 , 'spell'
\                                 , 'fileencoding'
\                                 , 'filetype'
\                                 , 'fileformat' ] ]
