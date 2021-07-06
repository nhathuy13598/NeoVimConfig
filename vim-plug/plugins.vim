" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Debugging plugin
    Plug 'puremourning/vimspector'

    " Nvim tree
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'akinsho/nvim-bufferline.lua'
    Plug 'glepnir/galaxyline.nvim'
    Plug 'norcalli/nvim-colorizer.lua'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Coc extension
" let g:coc_global_extensions = [
" \   'coc-css',
" \   'coc-html',
" \   'coc-emmet',
" \   'coc-eslint',
" \   'coc-prettier',
" \   'coc-tsserver',
" \   'coc-clangd',
" \   'coc-snippets',
" \ ]
