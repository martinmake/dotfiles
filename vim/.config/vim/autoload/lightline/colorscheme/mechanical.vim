let s:black = [ '#2b2b2b', 'Black' ]
let s:gray = [ '#323232', 238 ]
let s:white = [ '#a9b7c6', 15 ]
let s:cyan = [ '#6897bb' , 'Cyan' ]
let s:green = [ '#629755', 'green' ]
let s:purple = [ '#9876aa', 'Cyan' ]
let s:magenta = [ '#9876aa', 'Magenta' ]
let s:red = [ '#ff6b68', 204 ]
let s:yellow = [ '#ffc66d', 'yellow' ]
let s:blue= [ '#ffc66d', 'blue' ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:green ], [ s:magenta, s:black ] ]
let s:p.normal.right = [ [ s:black, s:green ], [ s:magenta, s:black ] ]
let s:p.inactive.left =  [ [ s:cyan, s:black ], [ s:cyan, s:black ] ]
let s:p.inactive.right = [ [ s:cyan, s:black ], [ s:cyan, s:black ] ]
let s:p.insert.left = [ [ s:black, s:blue ], [ s:magenta, s:black ] ]
let s:p.insert.right = [ [ s:black, s:blue ], [ s:magenta, s:black ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:red, s:black ] ]
let s:p.replace.right = [ [ s:black, s:red ], [ s:red, s:black ] ]
let s:p.visual.left = [ [ s:black, s:yellow ], [ s:magenta, s:black ] ]
let s:p.visual.right = [ [ s:black, s:yellow ], [ s:magenta, s:black ] ]
let s:p.normal.middle = [ [ s:magenta, s:black ] ]
let s:p.inactive.middle = [ [ s:gray, s:black ] ]
let s:p.tabline.left = [ [ s:magenta, s:black ] ]
let s:p.tabline.tabsel = [ [ s:black, s:magenta ] ]
let s:p.tabline.middle = [ [ s:magenta, s:black ] ]
let s:p.tabline.right = [ [ s:white, s:black] ]
let s:p.normal.error = [ [ s:red, s:black ] ]
let s:p.normal.warning = [ [ s:yellow, s:black ] ]

let g:lightline#colorscheme#mechanical#palette = lightline#colorscheme#flatten(s:p)
