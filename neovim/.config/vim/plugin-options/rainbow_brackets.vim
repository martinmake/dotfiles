let g:rainbow_conf = {
\   'ctermfgs':    [
\                  'lightBlue',
\                  'lightYellow',
\                  'lightCyan',
\                  'lightMagenta'
                  \],
\   'operators':   '_,_',
\   'parentheses': [
                        \'start=/(/ end=/)/ fold',
                        \'start=/\[/ end=/\]/ fold'
                  \],
\   'separately':  {
\       '*': {},
\       'vim': {
\           'parentheses': [
                                \'start=/(/ end=/)/',
                                \'start=/\[/ end=/\]/',
                                \'start=/{/ end=/}/ fold',
                                \'start=/(/ end=/)/ containedin=vimFuncBody',
                                \'start=/\[/ end=/\]/ containedin=vimFuncBody',
                                \'start=/{/ end=/}/ fold containedin=vimFuncBody'
                          \],
\       },
\       'html': {
\           'parentheses': [
                                \'start=/\v\<(('.
                                                    \'area|'.
                                                    \'base|'.
                                                    \'br|'.
                                                    \'col|'.
                                                    \'embed|'.
                                                    \'hr|'.
                                                    \'img|'.
                                                    \'input|'.
                                                    \'keygen|'.
                                                    \'link|'.
                                                    \'title|'.
                                                    \'script|'.
                                                    \'menuitem|'.
                                                    \'meta|'.
                                                    \'param|'.
                                                    \'source|'.
                                                    \'track|'.
                                                    \'wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'.
                                                    \"'".'[^'."'".']*'."'".'|'.
                                                    \'[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'
                          \],
\       },
\       'css': 0,
\   }
\}

let g:rainbow_active = 1
