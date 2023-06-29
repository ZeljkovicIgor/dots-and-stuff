"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------
syntax on
set relativenumber
set number
set expandtab
set splitright
set splitbelow
set list
set listchars=tab:▸\ ,trail:·
set scrolloff=16
set hidden
set shortmess+=c
set signcolumn=number
set termguicolors
set nofixeol
set tabstop=4
set clipboard=unnamedplus
set showcmd

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

" Clear highlighted search
let mapleader = ","
nnoremap <leader><space> :noh<cr>
" exit insert mode
inoremap jj <ESC>

" solves the python indentation in brackets problem
let g:pyindent_open_paren = ''

" Allow gf to open non-existent files
map gf :edit <cfile><cr>
