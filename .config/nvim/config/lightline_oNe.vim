" =============================================================================
" Filename: autoload/lightline/colorscheme/oNe.vim
" Author: TomatoMus
" License: MIT License
" Last Change: 2017/12/02
" =============================================================================

let s:fg     = [ '#9DA5B4', 145 ]
let s:blue   = [ '#61afef', 75 ]
let s:green  = [ '#98c379', 76 ]
let s:purple = [ '#c678dd', 176 ]
let s:red1   = [ '#e06c75', 168 ]
let s:red2   = [ '#be5046', 168 ]
let s:yellow = [ '#e5c07b', 180 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:bg     = [ '#21252B', 235 ]
" let s:bg     = [ '#282C34', 235 ]
let s:gray1  = [ '#5c6370', 241 ]
let s:gray2  = [ '#6E717F', 235 ]
let s:gray3  = [ '#282C34', 240 ]

let s:p.normal.left     = [ [ s:green, s:bg, 'bold' ], [ s:fg, s:bg ] ]
let s:p.normal.middle   = [ [ s:fg, s:bg ] ]

" わからん
let s:p.inactive.left   = [ [ s:gray1,  s:bg ], [ s:gray1, s:bg ] ]
let s:p.inactive.middle = [ [ s:gray1, s:bg ] ]
let s:p.inactive.right  = [ [ s:gray1, s:bg ], [ s:gray1, s:bg ] ]

let s:p.insert.left     = [ [ s:blue, s:bg, 'bold' ], [ s:fg, s:bg ] ]
let s:p.replace.left    = [ [ s:fg, s:bg, 'bold' ], [ s:fg, s:bg ] ]
let s:p.visual.left     = [ [ s:purple, s:bg, 'bold' ], [ s:fg, s:bg ] ]

let s:p.normal.right   = [ [ s:fg, s:bg, 'bold' ], [ s:fg, s:bg, 'bold' ] ]

let s:p.normal.error   = [ [ s:red2,   s:bg ] ]
let s:p.normal.warning = [ [ s:yellow, s:bg ] ]

let s:p.insert.right   = [ [ s:fg, s:bg, 'bold' ], [ s:fg, s:bg, 'bold' ] ]
let s:p.replace.right  = [ [ s:fg, s:bg, 'bold' ], [ s:fg, s:bg, 'bold' ] ]
let s:p.visual.right   = [ [ s:fg, s:bg, 'bold' ], [ s:fg, s:bg, 'bold' ] ]

let s:p.tabline.left   = [ [ s:gray2, s:bg ] ]
let s:p.tabline.tabsel = [ [ s:fg, s:gray3, 'bold' ] ]
let s:p.tabline.middle = [ [ s:gray2, s:bg ] ]
let s:p.tabline.right  = copy(s:p.normal.right)

let g:lightline#colorscheme#oNe#palette = lightline#colorscheme#flatten(s:p)
