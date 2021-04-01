set number

" number of visual spaces per TAB
set tabstop=4 shiftwidth=4 expandtab

" Display all white space character
" https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character/1675698
"↵,→,~,↷,↶,·,¬,⇨,⋄,‸
set listchars=tab:⇨\ ,trail:⋄
set list

" Remove vertical split line
set fillchars=vert:\
highlight VertSplit guifg=#ebdbb2 guibg=#282828 ctermfg=235 ctermbg=235

" Remove tilde
highlight EndOfBuffer guifg=#ebdbb2 guibg=#282828 ctermfg=235 ctermbg=235

" Set guifont
set guifont=Consolas:14

" Blink cursor
set guicursor+=a:-blinkwait175-blinkoff150-blinkon175
