set number relativenumber

" Display all white space character
" https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character/1675698
"↵,→,~,↷,↶,·,¬,⇨,⋄,‸
set listchars=eol:↵,tab:⇨\ ,trail:⋄
set list

" number of visual spaces per TAB
set tabstop=4
set shiftwidth=4

" Remove vertical split line
set fillchars+=vert:\ 
highlight VertSplit cterm=NONE

" Set guifont
set guifont=Consolas:13
