" Go back
nmap <F8> <C-w>w

" Compile files according to file type
autocmd FileType cpp,c nmap <C-S-b> :w<CR> :!g++ % -o %<<CR>

" Run files according to file type
autocmd FileType cpp,c nmap <F5> :w<CR> :terminal ./%<<CR>

" Compile and run files according to file type
autocmd FileType cpp,c nmap <S-b> :w <CR> :terminal g++ % -o %< && ./%< <CR>

" Map coc-explorer key
nmap <F3> :CocCommand explorer<CR>

" Map ESC key to jk
inoremap jk <ESC>
vnoremap jk <ESC>

" Maximize and Minimize window
nmap m :tabedit %<CR>
nmap mi :tabclose<CR>
