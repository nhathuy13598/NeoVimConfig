-- blankline
vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"

vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
vim.g.indent_blankline_buftype_exclude = {"terminal"}

vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false

-- map leader to space
vim.g.mapleader = " "

-- auto save
vim.g.auto_save = 1

-- colorscheme related stuff
vim.cmd "syntax on"

local base16 = require "base16"
base16(base16.themes["onedark"], true)

-- hide line numbers in terminal windows
vim.api.nvim_exec(
    [[
   au BufEnter term://* setlocal nonumber
   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
   au BufEnter term://* set laststatus=0 
]],
    false
)
