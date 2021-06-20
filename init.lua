-- load all plugins
require "globals"
require "plugins"
require "settings"
require "mappings"

require "configs/top-bufferline"
require "configs/statusline"

require("colorizer").setup()
require("neoscroll").setup() -- smooth scroll

-- lsp stuff
require "configs/lsp-saga"
require "configs/nvim-lspconfig"
require "configs/compe-completion"

require "configs/highlights"

require "configs/treesitter-nvim"

require "configs/telescope-nvim"
require "configs/nvimTree" -- file tree stuff
require "configs/file-icons"

-- git signs , lsp symbols etc
require "configs/gitsigns-nvim"
require("nvim-autopairs").setup()
require("lspkind").init()

require "configs/zenmode"
require "configs/whichkey"
require "configs/dashboard"
require("nvim_comment").setup()
