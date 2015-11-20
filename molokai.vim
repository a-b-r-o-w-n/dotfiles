" =============================================================================
" Filename: autoload/lightline/colorscheme/molokai.vim
" Author: itchyny
" License: MIT License
" Last Change: 2013/09/07 12:22:37.
" =============================================================================
let s:base03 = '#fafafa'
let s:base023 = '#dfdfdf'
let s:base01 = '#b4b4b4'
let s:base00 = '#808080'
let s:base0 = '#666666'
let s:base1 = '#555555'
let s:base2 = '#4f4f4f'
let s:base3 = '#4d4d4c'
let s:black = '#1C1C1C'
let s:white = '#D0D0D0'
let s:gray = '#303030'
let s:light_gray = '#ff8700'
let s:red = '#FF005F'
let s:orange = '#D7F500'
let s:yellow = '#eab700'
let s:green = '#87FF00'
let s:cyan = '#3e999f'
let s:blue = '#5FD7FF'
let s:purple = '#AF5FFF'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:white, s:red ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:white, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.right = [ [ s:gray, s:base00 ], [ s:base00, s:gray ] ]
let s:p.inactive.left =  [ [ s:base0, s:gray ], [ s:base00, s:base03 ] ]
let s:p.insert.left = [ [ s:white, s:green ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:white, s:orange ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:white, s:purple ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base1, s:gray ] ]
let s:p.inactive.middle = [ [ s:base0, s:gray ] ]
let s:p.tabline.left = [ [ s:base2, s:base01 ] ]
let s:p.tabline.tabsel = [ [ s:base2, s:base023 ] ]
let s:p.tabline.middle = [ [ s:base01, s:base00 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:red, s:base01 ] ]
let s:p.normal.warning = [ [ s:yellow, s:base0 ] ]

let g:lightline#colorscheme#molokai#palette = lightline#colorscheme#fill(s:p)
