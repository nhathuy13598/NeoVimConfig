" Map ESC key to jk
inoremap jk <ESC>
vnoremap oo <ESC>

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

" Map keys for autocompletion
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
