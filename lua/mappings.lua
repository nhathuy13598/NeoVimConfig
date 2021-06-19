 local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}
local nsilent = {noremap = true, silent = true}

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them!
--[[ remove this line

map("n", "dd", [=[ "_dd ]=], opt)
map("v", "dd", [=[ "_dd ]=], opt)
map("v", "x", [=[ "_x ]=], opt)

 this line too ]]
-- OPEN TERMINALS --
map("n", "<C-l>", [[<Cmd>vnew term://bash <CR>]], opt) -- term over right
map("n", "<C-x>", [[<Cmd> split term://bash | resize 10 <CR>]], opt) --  term bottom
map("n", "<C-t>t", [[<Cmd> tabnew | term <CR>]], opt) -- term newtab

-- COPY EVERYTHING --
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- toggle numbers ---
map("n", "<Leader>n", [[ <Cmd> set nu!<CR>]], opt)

-- toggle truezen.nvim's ataraxis and minimalist mode
map("n", "<Leader>z", [[ <Cmd> TZAtaraxis<CR>]], opt)
map("n", "<Leader>m", [[ <Cmd> TZMinimalist<CR>]], opt)

map("n", "<C-s>", [[ <Cmd> w <CR>]], opt)
-- vim.cmd("inoremap jh <Esc>")

-- Commenter Keybinding
map("n", "<Leader>/", ":CommentToggle<CR>", nsilent)
map("v", "<Leader>/", ":CommentToggle<CR>", nsilent)

-- Remove highlights after searching
map("n", "<Leader>h", ":set hlsearch!<CR>", nsilent)

-- tab utilities
map("n", "<S-t>", [[<Cmd>tabnew<CR>]], nsilent) -- new tab
map("n", "<S-x>", [[<Cmd>bdelete<CR>]], nsilent) -- close tab

-- buffer utilities
map("n", "gb", [[<Cmd>BufferLinePick<CR>]], nsilent) --go to buffer
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], nsilent) -- next buffer
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], nsilent) -- prev buffer

-- nvimtree
map("n", "<C-n>", [[<Cmd>NvimTreeToggle<CR>]], nsilent)

-- telescope
require("telescope").load_extension("media_files")
map("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], nsilent)
map("n", "<Leader>fp", [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]],nsilent)

map("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], nsilent)
map("n", "<Leader>fh", [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], nsilent)
map("n", "<Leader>fo", [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], nsilent)
map("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], nsilent)

map("n", "<Leader>fw", [[<Cmd> Telescope live_grep<CR>]], nsilent)
map("n", "<Leader>fn", [[<Cmd> DashboardNewFile<CR>]], nsilent)
map("n", "<Leader>bm", [[<Cmd> DashboardJumpMarks<CR>]], nsilent)
map("n", "<Leader>sl", [[<Cmd> SessionLoad<CR>]], nsilent)
map("n", "<Leader>ss", [[<Cmd> SessionSave<CR>]], nsilent)