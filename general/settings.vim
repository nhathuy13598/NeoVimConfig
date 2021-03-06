set number

" number of visual spaces per TAB
set tabstop=4
set shiftwidth=4

" Display all white space character
" https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character/1675698
"↵,→,~,↷,↶,·,¬,⇨,⋄,‸
set listchars=tab:⇨\ ,trail:⋄
set list

" Remove vertical split line
set fillchars+=vert:\
highlight VertSplit cterm=NONE

" Set guifont
set guifont=Consolas:14

" Blink cursor
set guicursor+=a:-blinkwait175-blinkoff150-blinkon175

" Trim space
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()
