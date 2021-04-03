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

    " Highlight JXS
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'

    " Better Syntax Support
    "Plug 'sheerun/vim-polyglot'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    "CMake plugin
    Plug 'vhdirk/vim-cmake'

    "Theme
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'voldikss/vim-floaterm'

    " Debugging plugin
    Plug 'puremourning/vimspector'
    Plug 'szw/vim-maximizer'

    " Show Intellisense
    Plug 'liuchengxu/vim-which-key'

    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    " Go
    Plug 'fatih/vim-go'

    " Ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

    " Easymotion
    Plug 'easymotion/vim-easymotion'

    Plug 'airblade/vim-gitgutter'

    " Indent line
    Plug 'Yggdroot/indentLine'

    " Commentary
    Plug 'tpope/vim-commentary'

    " Quickly align
    Plug 'junegunn/vim-easy-align'

    " Vim snippet
    Plug 'honza/vim-snippets'

    " Auto close tag
    Plug 'alvan/vim-closetag'

    " Start screen
    Plug 'mhinz/vim-startify'

    " NERD tree
    Plug 'preservim/nerdtree'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Coc extension
let g:coc_global_extensions = [
\   'coc-css',
\   'coc-html',
\   'coc-json',
\   'coc-emmet',
\   'coc-eslint',
\   'coc-prettier',
\   'coc-tsserver',
\   'coc-clangd',
\ ]
