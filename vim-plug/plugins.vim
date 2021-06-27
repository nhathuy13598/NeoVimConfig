" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
let g:polyglot_disabled = ['jsx']
let g:vim_jsx_pretty_highlight_close_tag = 1
call plug#begin('~/.config/nvim/autoload/plugged')

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    "Theme
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'

    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-surround'

    " Debugging plugin
    Plug 'puremourning/vimspector'

    " Indent line
    Plug 'Yggdroot/indentLine'

    " Themes
    Plug 'joshdick/onedark.vim'

    " Commentary
    Plug 'tpope/vim-commentary'

    " Vim snippet
    Plug 'honza/vim-snippets'

    " Auto close tag
    Plug 'alvan/vim-closetag'

    " Nvim tree
    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'akinsho/nvim-bufferline.lua'
    Plug 'glepnir/galaxyline.nvim'
    Plug 'norcalli/nvim-colorizer.lua'

    Plug 'nvim-treesitter/nvim-treesitter'
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
