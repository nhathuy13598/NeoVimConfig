require("which-key").setup {
    plugins = {
        marks       = true, --shows a list of your marks on ' and `
        registers   = true, --[[shows your registers on " in NORMAL or <C-r> in INSERT mode
                                the presets plugin, adds help for a bunch of default keybindings in Neovim
                                No actual key bindings are created]]
        spelling = {
            enabled         = false,    -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions     = 20        -- how many suggestions should be shown in the list?
        },
        presets  = {
            operators       = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions         = true, -- adds help for motions
            text_objects    = true, -- help for text objects triggered after entering an operator
            windows         = true, -- default bindings on <c-w>
            nav             = true, -- misc bindings to work with windows
            z               = true, -- bindings for folds, spelling and others prefixed with z
            g               = true, -- bindings for prefixed with g
        }
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = {gc = "Comments"},
    icons = {
        breadcrumb  = "»",  -- symbol used in the command line area that shows your active key combo
        separator   = "➜",  -- symbol used between a key and it's label
        group       = "+"   -- symbol prepended to a group
    },
    window = {
        border      = "none",       -- none, single, double, shadow
        position    = "bottom",     -- bottom, top
        margin      = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding     = {2, 2, 2, 2}  -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height  = {min = 4,  max = 25},  -- min and max height of the columns
        width   = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3                     -- spacing between columns
    },
    hidden          = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},    -- hide mapping boilerplate
    ignore_missing  = false,    -- enable this to hide mappings for which you didn't specify a label
    show_help       = true,     -- show help message on the command line when the popup is visible
    triggers        = "auto"    -- automatically setup triggers
    -- triggers = {"<Leader>"}  -- or specifiy a list manually
}

local opts = {
    prefix  = "<Leader>",
    mode    = "n",  -- NORMAL mode
    buffer  = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
    silent  = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait  = false -- use `nowait` when creating keymaps
}
local mappings = {
    ["/"] = "Comment",
    ["c"] = "Close Buffer",
    ["e"] = "Explorer",
    ["f"] = "Find File",
    ["h"] = "No Highlight",
    d = {
        name = "+Diagnostics",
        t = {"<Cmd>TroubleToggle<CR>",                              "Trouble"},
        w = {"<Cmd>TroubleToggle lsp_workspace_diagnostics<CR>",    "Workspace"},
        d = {"<Cmd>TroubleToggle lsp_document_diagnostics<CR>",     "Document"},
        q = {"<Cmd>TroubleToggle quickfix<CR>",                     "Quickfix"},
        l = {"<Cmd>TroubleToggle loclist<CR>",                      "Loclist"},
        r = {"<Cmd>TroubleToggle lsp_references<CR>",               "References"},
    },
    D = {
        name = "+Debug",
        b = {"<Cmd>DebugToggleBreakpoint<CR>",  "Toggle Breakpoint"},
        c = {"<Cmd>DebugContinue<CR>",          "Continue"},
        i = {"<Cmd>DebugStepInto<CR>",          "Step Into"},
        o = {"<Cmd>DebugStepOver<CR>",          "Step Over"},
        r = {"<Cmd>DebugToggleRepl<CR>",        "Toggle Repl"},
        s = {"<Cmd>DebugStart<CR>",             "Start"}
    },
    g = {
        name = "+Git",
        j = {"<Cmd>NextHunk<CR>",                   "Next Hunk"},
        k = {"<Cmd>PrevHunk<CR>",                   "Prev Hunk"},
        p = {"<Cmd>PreviewHunk<CR>",                "Preview Hunk"},
        r = {"<Cmd>ResetHunk<CR>",                  "Reset Hunk"},
        R = {"<Cmd>ResetBuffer<CR>",                "Reset Buffer"},
        s = {"<Cmd>StageHunk<CR>",                  "Stage Hunk"},
        u = {"<Cmd>UndoStageHunk<CR>",              "Undo Stage Hunk"},
        o = {"<Cmd>Telescope git_status<CR>",       "Open changed file"},
        b = {"<Cmd>Telescope git_branches<CR>",     "Checkout branch"},
        c = {"<Cmd>Telescope git_commits<CR>",      "Checkout commit"},
        C = {"<Cmd>Telescope git_bcommits<CR>",     "Checkout commit(for current file)"},
    },
    l = {
        name = "+LSP",
        a = {"<Cmd>Lspsaga code_action<CR>",                        "Code Action"},
        A = {"<Cmd>Lspsaga range_code_action<CR>",                  "Selected Action"},
        l = {"<Cmd>Lspsaga lsp_finder<CR>",                         "LSP Finder"},
        L = {"<Cmd>Lspsaga show_line_diagnostics<CR>",              "Line Diagnostics"},
        p = {"<Cmd>Lspsaga preview_definition<CR>",                 "Preview Definition"},
        r = {"<Cmd>Lspsaga rename<CR>",                             "Rename"},
        s = {"<Cmd>Telescope lsp_document_symbols<CR>",             "Document Symbols"},
        S = {"<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>",    "Workspace Symbols"},
        d = {"<Cmd>Telescope lsp_document_diagnostics<CR>",         "Document Diagnostics"},
        D = {"<Cmd>Telescope lsp_workspace_diagnostics<CR>",        "Workspace Diagnostics"},
        q = {"<Cmd>Telescope quickfix<CR>",                         "Quickfix"},
        f = {"<Cmd>LspFormatting<CR>",                              "Format"},
        i = {"<Cmd>LspInfo<CR>",                                    "Info"},
        t = {"<Cmd>LspTypeDefinition<CR>",                          "Type Definition"},
        x = {"<Cmd>cclose<CR>",                                     "Close Quickfix"},
    },
    s = {
        name = "+Search",
        b = {"<Cmd>Telescope buffers<CR>",                      "Find buffers"},
        c = {"<Cmd>Telescope colorscheme<CR>",                  "Colorscheme"},
        m = {"<Cmd>Telescope marks<CR>",                        "Marks"},
        M = {"<Cmd>Telescope man_pages<CR>",                    "Man Pages"},
        r = {"<Cmd>Telescope oldfiles<CR>",                     "Open Recent File"},
        R = {"<Cmd>Telescope registers<CR>",                    "Registers"},
        t = {"<Cmd>Telescope live_grep<CR>",                    "Text"},
        h = {"<Cmd>Telescope help_tags<CR>",                    "Help tags"}
    },
    S = {
        name = "+Session",
        s = {"<Cmd>SessionSave<CR>", "Save Session"},
        l = {"<Cmd>SessionLoad<cr>", "Load Session"}
    },

    -- extras
    z = {
        name = "+Zen",
        s = {"<Cmd>TZBottom<CR>",   "Toggle status line"},
        t = {"<Cmd>TZTop<CR>",      "Toggle tab bar"},
        z = {"<Cmd>TZAtaraxis<CR>", "Toggle zen"},
    }
}

local wk = require("which-key")
wk.register(mappings, opts)
