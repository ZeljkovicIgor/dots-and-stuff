"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------
set relativenumber
set number
set expandtab
set splitright
set splitbelow
set list
set listchars=tab:▸\ ,trail:·
set scrolloff=16
set hidden
set updatetime=300 " because coc.nvim said so in their config
set shortmess+=c
set signcolumn=number
set termguicolors

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

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

call plug#begin()

source ~/.config/nvim/plugins/sensible.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/autopairs.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/airline-themes.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/snippets.vim
source ~/.config/nvim/plugins/bracey.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/devicons.vim
source ~/.config/nvim/plugins/sfartify.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/repeat.vim
source ~/.config/nvim/plugins/intelephense-coc.vim

call plug#end()

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

colorscheme dracula
highlight Normal guibg=NONE guibg=NONE
