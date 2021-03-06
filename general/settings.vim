set number relativenumber

" number of visual spaces per TAB
set tabstop=4
set shiftwidth=4

" Remove vertical split line
set fillchars+=vert:\ 
highlight VertSplit cterm=NONE

" Set guifont
set guifont=Consolas:13

" Blink cursor
set guicursor+=a:-blinkwait175-blinkoff150-blinkon175

" Trim space
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()
