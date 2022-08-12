" This is basically a coppied transparent.vim airline theme with colors fit to my liking
" The middle area background is actually transparent now, so it should
" probably go well with lots of other themes. I personally use it together
" with Dracula theme (tho i changed Dracula's background color to be a bit darker)


" Color palette
let s:deepbluesky = [24, '#6272a4']
let s:springgreen = [29, '#00875f']
let s:orchid = [212, '#ff79c6']
let s:lightsalmon = [216, '#ffaf87']
let s:indianred = [203, '#ff5555']
let s:white = [195, '#f8f8f2']
let s:black = [235, '#161925']
let s:gold = [220, '#ffb86c']
let s:none = 'NONE'


" Normal mode
let s:N1 = [s:white[1], s:deepbluesky[1], s:white[0], s:deepbluesky[0]]
let s:N2 = [s:deepbluesky[1], s:none, s:deepbluesky[0], s:none, s:none]

" Normal mode - modified
let s:NM1 = [s:black[1], s:gold[1], s:black[0], s:gold[0]]
let s:NM2 = [s:gold[1], s:none, s:gold[0], s:none, 'italic']

" Insert mode
let s:I1 = [s:white[1], s:springgreen[1], s:white[0], s:springgreen[0]]
let s:I2 = [s:springgreen[1], s:none, s:springgreen[0], s:none, s:none]

" Visual mode
let s:V1 = [s:black[1], s:orchid[1], s:black[0], s:orchid[0]]
let s:V2 = [s:orchid[1], s:none, s:orchid[0], s:none, s:none]

" Replace mode
let s:R1 = [s:black[1], s:lightsalmon[1], s:black[0], s:lightsalmon[0]]
let s:R2 = [s:lightsalmon[1], s:none, s:lightsalmon[0], s:none, s:none]

" Inactive pane
let s:IA = [s:deepbluesky[1], s:none, s:deepbluesky[0], s:none, 'italic']

" Errors
let s:ERR = [s:white[1], s:indianred[1], s:white[0], s:indianred[0], s:none]

let g:airline#themes#igor#palette = {}
let g:airline#themes#igor#palette.accents = {
    \ 'red': ['#d70000', '', 160, '', '']}


let g:airline#themes#igor#palette.normal = {
    \ 'airline_a': s:N1,
    \ 'airline_b': s:N2,
    \ 'airline_c': s:N2,
    \ 'airline_x': s:N2,
    \ 'airline_y': s:N2,
    \ 'airline_z': s:N1}

let g:airline#themes#igor#palette.normal_modified = {
    \ 'airline_a': s:NM1,
    \ 'airline_b': s:NM2,
    \ 'airline_c': s:NM2,
    \ 'airline_x': s:NM2,
    \ 'airline_y': s:NM2,
    \ 'airline_z': s:NM1}

let g:airline#themes#igor#palette.insert = {
    \ 'airline_a': s:I1,
    \ 'airline_b': s:I2,
    \ 'airline_c': s:I2,
    \ 'airline_x': s:I2,
    \ 'airline_y': s:I2,
    \ 'airline_z': s:I1}
let g:airline#themes#igor#palette.insert_modified = {}

let g:airline#themes#igor#palette.visual = {
    \ 'airline_a': s:V1,
    \ 'airline_b': s:V2,
    \ 'airline_c': s:V2,
    \ 'airline_x': s:V2,
    \ 'airline_y': s:V2,
    \ 'airline_z': s:V1}
let g:airline#themes#igor#palette.visual_modified = {}

let g:airline#themes#igor#palette.replace = {
    \ 'airline_a': s:R1,
    \ 'airline_b': s:R2,
    \ 'airline_c': s:R2,
    \ 'airline_x': s:R2,
    \ 'airline_y': s:R2,
    \ 'airline_z': s:R1}
let g:airline#themes#igor#palette.replace_modified = {}

let g:airline#themes#igor#palette.inactive = {
    \ 'airline_a': s:IA,
    \ 'airline_b': s:IA,
    \ 'airline_c': s:IA,
    \ 'airline_x': s:IA,
    \ 'airline_y': s:IA,
    \ 'airline_z': s:IA}
let g:airline#themes#igor#palette.inactive_modified = {}

let g:airline#themes#igor#palette.tabline = {
      \ 'airline_tab':      s:N1,
      \ 'airline_tabsel':   s:N1,
      \ 'airline_tabfill':  s:N2,
      \ 'airline_tabmod':   s:NM1,
      \ 'airline_tabmod_unsel':   s:NM2,
      \ }

" Warnings
let g:airline#themes#igor#palette.normal.airline_warning = s:NM1

let g:airline#themes#igor#palette.normal_modified.airline_warning =
    \ g:airline#themes#igor#palette.normal.airline_warning

let g:airline#themes#igor#palette.insert.airline_warning =
    \ g:airline#themes#igor#palette.normal.airline_warning

let g:airline#themes#igor#palette.insert_modified.airline_warning =
    \ g:airline#themes#igor#palette.normal.airline_warning

let g:airline#themes#igor#palette.visual.airline_warning =
    \ g:airline#themes#igor#palette.normal.airline_warning

let g:airline#themes#igor#palette.visual_modified.airline_warning =
    \ g:airline#themes#igor#palette.normal.airline_warning

let g:airline#themes#igor#palette.replace.airline_warning =
    \ g:airline#themes#igor#palette.normal.airline_warning

let g:airline#themes#igor#palette.replace_modified.airline_warning =
    \ g:airline#themes#igor#palette.normal.airline_warning


" Errors
let g:airline#themes#igor#palette.normal.airline_error = s:ERR

let g:airline#themes#igor#palette.normal_modified.airline_error =
      \ g:airline#themes#igor#palette.normal.airline_error

let g:airline#themes#igor#palette.insert.airline_error =
      \ g:airline#themes#igor#palette.normal.airline_error

let g:airline#themes#igor#palette.insert_modified.airline_error =
      \ g:airline#themes#igor#palette.normal.airline_error

let g:airline#themes#igor#palette.insert_modified.airline_error =
      \ g:airline#themes#igor#palette.normal.airline_error
 
let g:airline#themes#igor#palette.visual.airline_error =
      \ g:airline#themes#igor#palette.normal.airline_error

let g:airline#themes#igor#palette.visual_modified.airline_error =
      \ g:airline#themes#igor#palette.normal.airline_error
 
let g:airline#themes#igor#palette.replace.airline_error =
      \ g:airline#themes#igor#palette.normal.airline_error

let g:airline#themes#igor#palette.replace_modified.airline_error =
      \ g:airline#themes#igor#palette.normal.airline_error
