Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeFind', 'NERDTreeClose' ] }

function! OpenNerdTree()
  if !exists('g:NERDTree') || !g:NERDTree.IsOpen()
    :NERDTreeFind
  else
    :NERDTreeClose
  endif
endfunction

nnoremap <silent><C-b> :call OpenNerdTree() <CR>
