" Go back
nmap <F8> <C-w>w

" Compile and run files according to file type
autocmd FileType cpp,c nmap <F5> :w <CR> :terminal g++ % -o %< && ./%< <CR>

" Map coc-explorer key
nmap <F3> :CocCommand explorer<CR>

" Map ESC key to jk
inoremap jk <ESC>
vnoremap jk <ESC>
