set number relativenumber

" number of visual spaces per TAB
set tabstop=4 shiftwidth=4 expandtab

" Display all white space character
set listchars=tab:⇨\ ,trail:.
set list

" Blink cursor
set guicursor+=a:-blinkwait175-blinkoff150-blinkon175

let g:vimspector_base_dir=expand('$HOME/.config/nvim/')

" Map space to leader
let mapleader = " "