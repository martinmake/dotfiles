let s:none    = [ '#2b2b2b',  'None'   ]
let s:black   = [ '#2b2b2b', 'Black'   ]
let s:gray    = [ '#323232',  238      ]
let s:white   = [ '#a9b7c6',  15       ]
let s:cyan    = [ '#6897bb', 'Cyan'    ]
let s:green   = [ '#629755', 'Green'   ]
let s:purple  = [ '#9876aa', 'Cyan'    ]
let s:magenta = [ '#9876aa', 'Magenta' ]
let s:red     = [ '#ff6b68', 'Red'     ]
let s:yellow  = [ '#ffc66d', 'Yellow'  ]
let s:orange  = [ '#ffc66d',  3        ]
let s:blue    = [ '#ffc66d', 'Blue'    ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:black   , s:green   , 'bold' ] , [ s:black , s:magenta , 'bold' ]  ]
let s:p.normal.middle   = [ [ s:black   , s:magenta ,        ] ,                                   ]
let s:p.normal.right    = [ [ s:black   , s:green   , 'bold' ] , [ s:black , s:magenta ,        ]  ]
let s:p.normal.error    = [ [ s:black   , s:cyan    , 'bold' ] ,                                   ]
let s:p.normal.warning  = [ [ s:black   , s:magenta , 'bold' ] ,                                   ]

let s:p.tabline.tabsel  = [ [ s:black   , s:magenta , 'bold' ] ,                                   ]
let s:p.tabline.left    = [ [ s:black   , s:cyan    , 'bold' ] ,                                   ]
let s:p.tabline.middle  = [ [ s:white   , s:black   ,        ] ,                                   ]
let s:p.tabline.right   = [ [ s:yellow  , s:red     ,        ] ,                                   ]

let s:p.inactive.left   = [ [ s:black   , s:cyan    , 'bold' ] , [ s:black , s:cyan    , 'bold' ]  ]
let s:p.inactive.middle = [ [ s:black   , s:cyan    , 'bold' ] ,                                   ]
let s:p.inactive.right  = [ [ s:black   , s:cyan    , 'bold' ] , [ s:black , s:cyan    , 'bold' ]  ]

let s:p.insert.left     = [ [ s:black   , s:blue    , 'bold' ] , [ s:black , s:magenta , 'bold' ]  ]
let s:p.insert.right    = [ [ s:black   , s:blue    , 'bold' ] , [ s:black , s:magenta , 'bold' ]  ]

let s:p.replace.left    = [ [ s:black   , s:cyan    , 'bold' ] , [ s:black , s:cyan    , 'bold' ]  ]
let s:p.replace.right   = [ [ s:black   , s:cyan    , 'bold' ] , [ s:black , s:cyan    , 'bold' ]  ]

let s:p.visual.left     = [ [ s:black   , s:orange  , 'bold' ] ,                                   ]
let s:p.visual.right    = [ [ s:black   , s:orange  , 'bold' ] ,                                   ]

let s:p.replace.middle  = [ [ s:black   , s:magenta ,        ] ,                                   ]
let s:p.insert.middle   = [ [ s:black   , s:magenta ,        ] ,                                   ]
let s:p.visual.middle   = [ [ s:black   , s:magenta ,        ] ,                                   ]

let g:lightline#colorscheme#mechanical#palette = lightline#colorscheme#flatten(s:p)
