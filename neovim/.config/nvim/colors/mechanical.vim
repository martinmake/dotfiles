set background=dark
highlight clear
syntax reset

let g:colors_name = 'mechanical'

" Unsorted{{{
hi SignColumn        ctermfg=none        ctermbg=none     cterm=none
hi Title             ctermfg=none        ctermbg=none     cterm=none
hi Info              ctermfg=blue        ctermbg=none     cterm=none
hi HighlightText     ctermfg=cyan        ctermbg=none     cterm=bold,reverse
hi MatchParen        ctermfg=none        ctermbg=none     cterm=bold,reverse
" }}}
" special {{{
  hi TODO              ctermfg=cyan        ctermbg=none       cterm=reverse,bold
  hi VertSplit         ctermfg=cyan        ctermbg=none       cterm=bold
  hi Normal            ctermfg=white       ctermbg=none       cterm=none
  hi Visual            ctermfg=black       ctermbg=3          cterm=bold
  hi Special           ctermfg=darkMagenta ctermbg=none       cterm=none
  hi NonText           ctermfg=235         ctermbg=none       cterm=none
  hi SpecialKey        ctermfg=red         ctermbg=none       cterm=bold
  hi Conceal           ctermfg=red         ctermbg=none       cterm=bold
  hi EndOfBuffer       ctermfg=blue        ctermbg=none       cterm=none
" }}}
" folding {{{
hi Folded            ctermfg=blue        ctermbg=none     cterm=none
hi FoldColumn        ctermfg=blue        ctermbg=none     cterm=none
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
hi DiffChange        ctermfg=3           ctermbg=none     cterm=italic
hi DiffText          ctermfg=red         ctermbg=none     cterm=bold
" }}}
" Pmenu {{{
hi Pmenu             ctermfg=cyan        ctermbg=233      cterm=none
hi PmenuSel          ctermfg=magenta     ctermbg=none     cterm=reverse,bold
hi PmenuSbar         ctermfg=cyan        ctermbg=none     cterm=none
hi PmenuThumb        ctermfg=cyan        ctermbg=none     cterm=reverse
" }}}
" LineNr {{{
hi LineNr       ctermfg=cyan    ctermbg=none     cterm=none
hi CursorLineNr ctermfg=magenta ctermbg=none     cterm=bold
" }}}
" StatusLine {{{
hi StatusLine        ctermfg=cyan        ctermbg=none     cterm=none
hi StatusLineNC      ctermfg=none        ctermbg=none     cterm=none
" }}}
" WildMenu {{{
hi WildMenu          ctermfg=cyan        ctermbg=none     cterm=reverse,bold
" }}}
" TabLine {{{
hi TabLine           ctermfg=white       ctermbg=none     cterm=none
hi TabLineSel        ctermfg=cyan        ctermbg=none     cterm=reverse,bold
hi TabLineFill       ctermfg=none        ctermbg=none     cterm=none
" }}}
" OverLength {{{
hi ColorColumn       ctermfg=red         ctermbg=black    cterm=bold
hi OverLength        ctermfg=red         ctermbg=none     cterm=bold
" }}}
" Cursor {{{
hi Cursor            ctermfg=yellow      ctermbg=none     cterm=none
hi CursorLine        ctermfg=none        ctermbg=233      cterm=none
hi CursorColumn      ctermfg=none        ctermbg=233      cterm=none
" }}}
" important {{{
hi Error             ctermfg=red         ctermbg=black    cterm=reverse,bold
hi Warning           ctermfg=yellow      ctermbg=black    cterm=bold,reverse
" }}}
" code {{{
hi Comment           ctermfg=darkGreen   ctermbg=none     cterm=italic
" hi Comment           ctermfg=darkGreen   ctermbg=none     cterm=none
hi Constant          ctermfg=red         ctermbg=none     cterm=none
hi PreProc           ctermfg=darkMagenta ctermbg=none     cterm=none
hi Keyword           ctermfg=darkCyan    ctermbg=none     cterm=none
hi Identifier        ctermfg=white       ctermbg=none     cterm=none
hi Structure         ctermfg=lightGreen  ctermbg=none     cterm=none
hi Type              ctermfg=lightGreen  ctermbg=none     cterm=none
hi Function          ctermfg=cyan        ctermbg=none     cterm=none
hi Conditional       ctermfg=cyan        ctermbg=none     cterm=none
hi Statement         ctermfg=cyan        ctermbg=none     cterm=none
" }}}
" spell {{{
hi SpellBad          ctermfg=red         ctermbg=none     cterm=reverse,bold
hi SpellCap          ctermfg=blue        ctermbg=none     cterm=reverse,bold
hi SpellLocal        ctermfg=magenta     ctermbg=none     cterm=reverse,bold
hi SpellRare         ctermfg=cyan        ctermbg=none     cterm=reverse,bold
" }}}
" float {{{
hi FloatBorder       ctermfg=magenta     ctermbg=none     cterm=bold
" }}}

" links {{{
hi link SpellBad Error
hi link SpellCap Warning
hi link WarningMsg Warning
" }}}
