local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}
local nsilent = {noremap = true, silent = true}

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', nsilent)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', nsilent)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', nsilent)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', nsilent)

-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', nsilent)
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', nsilent)

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', nsilent)
vim.api.nvim_set_keymap('v', '>', '>gv', nsilent)

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', nsilent)
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', nsilent)

-- OPEN TERMINALS --
map("n", "<C-x>", [[<Cmd> split term://bash | resize 10 <CR>]], opt) --  term bottom

-- COPY EVERYTHING --
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- toggle numbers ---
map("n", "<Leader>n", [[ <Cmd> set nu!<CR>]], opt)

map("n", "<C-s>", [[ <Cmd> w <CR>]], opt)

-- Commenter Keybinding
map("n", "<Leader>/", ":CommentToggle<CR>", nsilent)
map("v", "<Leader>/", ":CommentToggle<CR>", nsilent)

-- Remove highlights after searching
map("n", "<Leader>h", ":nohlsearch<CR>", nsilent)

-- tab utilities
map("n", "<S-t>", [[<Cmd>tabnew<CR>]],  nsilent) -- new tab
map("n", "<S-x>", [[<Cmd>bdelete<CR>]], nsilent) -- close tab

-- buffer utilities
map("n", "gb",      [[<Cmd>BufferLinePick<CR>]],        nsilent) -- go to buffer
map("n", "<TAB>",   [[<Cmd>BufferLineCycleNext<CR>]],   nsilent) -- next buffer
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]],   nsilent) -- prev buffer

-- nvimtree
map("n", "<C-n>", [[<Cmd>NvimTreeToggle<CR>]], nsilent)
