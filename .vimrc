set relativenumber
set number

" set leader and map leader and space to clear highlighted stuff
let mapleader = ","
nnoremap <leader><space> :noh<cr>

" solves the python indentation in brackets problem
let g:pyindent_open_paren = ''

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'sheerun/vim-polyglot'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
nnoremap <C-b> :NERDTreeToggle<CR> 

" Autocompletion...intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Adding a prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Use tab and shift tab to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use enter to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Select first completion item and confirm the completion when no item has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Plug 'scrooloose/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_html_checkers=['eslint', 'tidy']

"	parentheses settings
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='zenburn_igor'

Plug 'tpope/vim-commentary'

call plug#end()

colorscheme dracula
highlight Normal ctermbg=NONE ctermfg=NONE
