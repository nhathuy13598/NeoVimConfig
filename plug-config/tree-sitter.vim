lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c", 
        "bash", 
        "cmake", 
        "cpp", 
        "css", 
        "html", 
        "javascript", 
        "json", 
        "jsonc", 
        "lua"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}
EOF