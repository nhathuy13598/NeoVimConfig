set number

" number of visual spaces per TAB
set tabstop=4 shiftwidth=4 expandtab

" Display all white space character
" https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character/1675698
"↵,→,~,↷,↶,·,¬,⇨,⋄,‸
set listchars=tab:⇨\ ,trail:⋄
set list

" Set guifont
set guifont=Consolas:14

" Blink cursor
set guicursor+=a:-blinkwait175-blinkoff150-blinkon175

" Auto unhighlight searched text
autocmd InsertEnter * :let @/=""

" Disable quote concealing in JSON files
autocmd Filetype json
  \ let g:indentLine_setConceal = 0 |
  \ let g:vim_json_syntax_conceal = 0
