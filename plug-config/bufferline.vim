lua << EOF
require "bufferline".setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree", 
                text = "File Explorer", 
                padding = 1
            }
        },
        buffer_close_icon       = "",
        modified_icon           = "",
        close_icon              = "",
        left_trunc_marker       = "",
        right_trunc_marker      = "",
        max_name_length         = 14,
        max_prefix_length       = 13,
        tab_size                = 20,
        show_tab_indicators     = true,
        enforce_regular_tabs    = false,
        view                    = "multiwindow",
        show_buffer_close_icons = true,
        separator_style         = "thin",
        mappings                = "true"
    }
}

local opt = {silent = true}
local map = vim.api.nvim_set_keymap

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
EOF