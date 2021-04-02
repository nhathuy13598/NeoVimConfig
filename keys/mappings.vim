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

nmap <C-space> :bnext<CR>
