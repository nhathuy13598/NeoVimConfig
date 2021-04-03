let g:NERDTreeIgnore = ['^build$', '^.git$', '^node_modules$']

" Remove first line in NERDTree
let NERDTreeMinimalUI=1

" Quick open NERDTree
nnoremap <space>x :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
