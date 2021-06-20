local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
    function()
        -- using packer.nvim
        use "wbthomason/packer.nvim"

        -- buffer line
        use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"}

        -- color related stuff
        use "siduck76/nvim-base16.lua"
        use "norcalli/nvim-colorizer.lua"

        -- lang stuff
        use "nvim-treesitter/nvim-treesitter"
        use "neovim/nvim-lspconfig"
        use "glepnir/lspsaga.nvim"
        use "hrsh7th/nvim-compe"
        use "onsails/lspkind-nvim"
        use "sbdchd/neoformat"
        use "kabouzeid/nvim-lspinstall"
        use {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons"}

        use "lewis6991/gitsigns.nvim"
        use "glepnir/galaxyline.nvim"
        use "windwp/nvim-autopairs"
        use "alvan/vim-closetag"

        -- Comment
        use "terrortylor/nvim-comment"

        -- snippet support
        use "hrsh7th/vim-vsnip"
        use "rafamadriz/friendly-snippets"

        -- file managing , picker etc
        use {"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons"}
        use "ryanoasis/vim-devicons"
        use {"nvim-telescope/telescope.nvim", requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
        use "nvim-telescope/telescope-media-files.nvim"

        -- misc
        use "glepnir/dashboard-nvim"
        use "tweekmonster/startuptime.vim"
        use "907th/vim-auto-save"
        use "karb94/neoscroll.nvim"
        use "kdav5758/TrueZen.nvim"
        use "folke/which-key.nvim"
        use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
    end,
    {
        display = {
            border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
        }
    }
)
