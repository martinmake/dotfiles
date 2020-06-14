set noshowmode

let g:lightline = { 'colorscheme': g:colors_name }

let g:lightline.component = { 'mode'        : '%{lightline#mode()}',
                            \ 'absolutepath': '%F',
                            \ 'relativepath': '%f',
                            \ 'filename'    : '%t',
                            \ 'modified'    : '%M',
                            \ 'bufnum'      : '%n',
                            \ 'paste'       : '%{&paste?"PASTE":""}',
                            \ 'readonly'    : '%R',
                            \ 'charvalue'   : '%b',
                            \ 'charvaluehex': '0x%B',
                            \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
                            \ 'fileformat'  : '%{&ff}',
                            \ 'filetype'    : '%{&ft!=#""?&ft:"no ft"}',
                            \ 'percent'     : '%3p%%',
                            \ 'percentwin'  : '%P',
                            \ 'spell'       : '%{&spell?&spelllang:""}',
                            \ 'lineinfo'    : '%3l:%-2v',
                            \ 'line'        : '%l',
                            \ 'column'      : '%c',
                            \ 'close'       : '☭ ',
                            \ 'winnr'       : '%{winnr()}' }

let g:lightline.active = {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent'  ],
      \              [ 'fileformat',
                     \ 'fileencoding',
                     \ 'filetype',
                     \ 'charvaluehex' ] ]
      \ }
