set background=dark
highlight clear
syntax reset

let g:colors_name = 'mechanical'

" if has('nvim') " {{{
"   let g:terminal_background = "#000000"
"   let g:terminal_foreground = "#ffffff"
"   let g:terminal_color_0    = "#000000"
"   let g:terminal_color_1    = "#cd0000"
"   let g:terminal_color_2    = "#00cd00"
"   let g:terminal_color_3    = "#cdcd00"
"   let g:terminal_color_4    = "#2020ff"
"   let g:terminal_color_5    = "#cd00cd"
"   let g:terminal_color_6    = "#00cdcd"
"   let g:terminal_color_7    = "#e5e5e5"
"   let g:terminal_color_8    = "#4d4d4d"
"   let g:terminal_color_9    = "#ff0000"
"   let g:terminal_color_10   = "#00ff00"
"   let g:terminal_color_11   = "#ffff00"
"   let g:terminal_color_12   = "#3030ff"
"   let g:terminal_color_13   = "#ff00ff"
"   let g:terminal_color_14   = "#00ffff"
"   let g:terminal_color_15   = "#fafafa"
" endif " }}}

" Unsorted{{{
hi SignColumn        ctermfg=none        ctermbg=none     cterm=none
hi Title             ctermfg=none        ctermbg=none     cterm=none
hi Info              ctermfg=blue        ctermbg=none     cterm=none
hi HighlightText     ctermfg=cyan        ctermbg=none     cterm=bold,reverse
" }}}
" special {{{
  hi TODO              ctermfg=lightBlue   ctermbg=none     cterm=reverse,bold
  hi VertSplit         ctermfg=cyan        ctermbg=none     cterm=bold
  hi Normal            ctermfg=white       ctermbg=none     cterm=none
  hi Visual            ctermfg=none        ctermbg=234      cterm=bold
  hi Special           ctermfg=darkMagenta ctermbg=none     cterm=none
  hi NonText           ctermfg=235         ctermbg=none     cterm=bold
  hi SpecialKey        ctermfg=red         ctermbg=none     cterm=bold
  hi Conceal           ctermfg=red         ctermbg=none     cterm=bold
" }}}
" folding {{{
hi Folded            ctermfg=blue        ctermbg=none     cterm=none
hi FoldColumn        ctermfg=magenta     ctermbg=none     cterm=none
" }}}
" {{{ searching
hi Sneak             ctermfg=cyan        ctermbg=none     cterm=reverse,bold
hi SneakScope        ctermfg=magenta     ctermbg=none     cterm=reverse,bold
hi Search            ctermfg=cyan        ctermbg=none     cterm=reverse,bold
hi CurrentSearch     ctermfg=magenta     ctermbg=none     cterm=reverse,bold
hi NonMatch          ctermfg=245         ctermbg=none     cterm=none
" }}}
" diff {{{
hi DiffAdd           ctermfg=green       ctermbg=none     cterm=bold
hi DiffDelete        ctermfg=red         ctermbg=none     cterm=bold
hi DiffChange        ctermfg=white       ctermbg=none     cterm=italic
hi DiffText          ctermfg=red         ctermbg=none     cterm=bold
" }}}
" Pmenu {{{
hi Pmenu             ctermfg=lightBlue   ctermbg=none     cterm=none
hi PmenuSel          ctermfg=lightBlue   ctermbg=none     cterm=reverse,bold
hi PmenuSbar         ctermfg=lightBlue   ctermbg=none     cterm=none
hi PmenuThumb        ctermfg=lightBlue   ctermbg=none     cterm=reverse
" }}}
" LineNr {{{
hi LineNr       ctermfg=lightBlue   ctermbg=none     cterm=none
hi CursorLineNr ctermfg=magenta     ctermbg=none     cterm=bold
" }}}
" StatusLine {{{
hi StatusLine        ctermfg=lightBlue   ctermbg=none     cterm=none
hi StatusLineNC      ctermfg=none        ctermbg=none     cterm=none
" }}}
" WildMenu {{{
hi WildMenu          ctermfg=lightBlue   ctermbg=none     cterm=reverse,bold
" }}}
" TabLine {{{
hi TabLine           ctermfg=white       ctermbg=none     cterm=none
hi TabLineSel        ctermfg=lightBlue   ctermbg=none     cterm=reverse,bold
hi TabLineFill       ctermfg=none        ctermbg=none     cterm=none
" }}}
" OverLength {{{
hi ColorColumn       ctermfg=red         ctermbg=black    cterm=bold
hi OverLength        ctermfg=red         ctermbg=none     cterm=bold
" }}}
" Cursor {{{
hi Cursor            ctermfg=green       ctermbg=none     cterm=none
hi CursorLine        ctermfg=none        ctermbg=233      cterm=none
hi CursorColumn      ctermfg=none        ctermbg=233      cterm=none
" }}}
" important {{{
hi Error             ctermfg=red         ctermbg=black    cterm=reverse,bold
hi Warning           ctermfg=yellow      ctermbg=black    cterm=bold,reverse
" }}}
" code {{{
hi Comment           ctermfg=darkGreen   ctermbg=none     cterm=italic
hi Constant          ctermfg=red         ctermbg=none     cterm=none
hi PreProc           ctermfg=darkMagenta ctermbg=none     cterm=none
hi Keyword           ctermfg=darkCyan    ctermbg=none     cterm=none
hi Identifier        ctermfg=white       ctermbg=none     cterm=none
hi Structure         ctermfg=lightGreen  ctermbg=none     cterm=none
hi Type              ctermfg=lightGreen  ctermbg=none     cterm=none
hi Function          ctermfg=lightBlue   ctermbg=none     cterm=none
hi Conditional       ctermfg=lightBlue   ctermbg=none     cterm=none
hi Statement         ctermfg=lightBlue   ctermbg=none     cterm=none
" }}}
" links {{{
hi link SpellBad Error
hi link SpellCap Warning
hi link WarningMsg Warning
" }}}
