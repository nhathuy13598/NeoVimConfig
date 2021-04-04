" Compile files according to file type
autocmd FileType cpp,c nmap <C-S-b> :w<CR> :!g++ '%' -o '%'<<CR>

" Run files according to file type
autocmd FileType cpp,c nmap <F5> :w<CR> :terminal ./'%'<<CR>

" Compile and run files according to file type
autocmd FileType cpp,c nmap <S-b> :w <CR> :terminal g++ '%' -o '%'< && ./'%'< <CR>

" Map ESC key to jk
inoremap jk <ESC>
vnoremap jk <ESC>

" Maximize and Minimize window
nmap m :tabedit %<CR>
nmap mi :tabclose<CR>

" Move between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Map Ctrl + space to go to next buffer
nmap <C-space> :bnext<CR>

" Map keys related to Copy, Paste
nmap p gp
nmap P gP
" Yank line with new line
nmap C Y
" Yank without new line
nmap D y$

" Map keys for autocompletion
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
