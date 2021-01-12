let g:rainbow_active = 1

let g:rainbow_conf = { 'ctermfgs': [ 'cyan'
\                                  , 'magenta'
\                                  ]
\                    , 'separately': { '*': {}
\                                    , 'cpp': { 'parentheses': [ 'start=/(/ end=/)/ fold'
\                                                              , 'start=/\[/ end=/\]/ fold'
\                                                              , 'start=/{/ end=/}/ fold'
\                                                              , 'start=/</ end=/>/ fold'
\                                                              ]
\                                             , 'operators': '_,\|;\|:\|+\|-\|*\|/\|&\||\|\~\|^\|&&\|||\|=\|==\|!=\|<\|>_'
\                                             }
\                                    , 'css': 0
\                                    }
\                    }
