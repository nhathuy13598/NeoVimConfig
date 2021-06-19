local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "javascript",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        "go",
    },
    highlight = {
        enable              = true,
        use_languagetree    = true
    }
}
