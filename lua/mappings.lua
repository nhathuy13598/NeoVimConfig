local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}
local nsilent = {noremap = true, silent = true}

-- Better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', nsilent)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', nsilent)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', nsilent)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', nsilent)

-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', nsilent)

-- Better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', nsilent)
vim.api.nvim_set_keymap('v', '>', '>gv', nsilent)

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', nsilent)
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', nsilent)

-- Open terminals --
map("n", "<C-x>", [[<Cmd> split term://bash | resize 10 <CR>]], opt) --  term bottom

-- Copy everything --
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- Commenter Keybinding
map("n", "<Leader>/", ":CommentToggle<CR>", nsilent)
map("v", "<Leader>/", ":CommentToggle<CR>", nsilent)

-- Remove highlights after searching
map("n", "<Leader>h", ":nohlsearch<CR>", nsilent)

-- Delete buffer
map("n", "<Leader>c", [[<Cmd>bdelete<CR>]], nsilent)

-- Find files
map("n", "<Leader>f", [[<Cmd>Telescope find_files<CR>]], nsilent)

-- Tab utilities
map("n", "<S-t>", [[<Cmd>tabnew<CR>]],  nsilent) -- new tab

-- Buffer utilities
map("n", "gb",      [[<Cmd>BufferLinePick<CR>]],        nsilent) -- go to buffer
map("n", "<TAB>",   [[<Cmd>BufferLineCycleNext<CR>]],   nsilent) -- next buffer
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]],   nsilent) -- prev buffer

-- Nvimtree
map("n", "<Leader>e", [[<Cmd>NvimTreeToggle<CR>]], nsilent)

-- Map keys for autocompletion
vim.cmd([[inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"]])
vim.cmd([[inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"]])
