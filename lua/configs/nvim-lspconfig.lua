function On_attach(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}

    buf_set_keymap("n", "gD",           [[<Cmd>lua vim.lsp.buf.declaration()<CR>]],                                 opts)
    buf_set_keymap("n", "gd",           [[<Cmd>lua vim.lsp.buf.definition()<CR>]],                                  opts)
    buf_set_keymap("n", "K",            [[<Cmd>lua vim.lsp.buf.hover()<CR>]],                                       opts)
    buf_set_keymap("n", "gi",           [[<Cmd>lua vim.lsp.buf.implementation()<CR>]],                              opts)
    buf_set_keymap("n", "<C-k>",        [[<Cmd>lua vim.lsp.buf.signature_help()<CR>]],                              opts)
    buf_set_keymap("n", "<space>wa",    [[<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>]],                        opts)
    buf_set_keymap("n", "<space>wr",    [[<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>]],                     opts)
    buf_set_keymap("n", "<space>wl",    [[<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>]],  opts)
    buf_set_keymap("n", "<space>D",     [[<Cmd>lua vim.lsp.buf.type_definition()<CR>]],                             opts)
    buf_set_keymap("n", "<space>rn",    [[<Cmd>lua vim.lsp.buf.rename()<CR>]],                                      opts)
    buf_set_keymap("n", "gr",           [[<Cmd>lua vim.lsp.buf.references()<CR>]],                                  opts)
    buf_set_keymap("n", "<space>e",     [[<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]],                opts)
    buf_set_keymap("n", "[d",           [[<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]],                            opts)
    buf_set_keymap("n", "]d",           [[<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>]],                            opts)
    buf_set_keymap("n", "<space>q",     [[<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>]],                          opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", [[<Cmd>lua vim.lsp.buf.formatting()<CR>]],          opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", [[<Cmd>lua vim.lsp.buf.range_formatting()<CR>]],    opts)
    end
end

-- lspInstall + lspconfig stuff

local function setup_servers()
    require "lspinstall".setup()

    local lspconf = require("lspconfig")
    local servers = require "lspinstall".installed_servers()

    for _, lang in pairs(servers) do
        if lang ~= "lua" then
            lspconf[lang].setup {
                on_attach = On_attach,
                root_dir = function()
                    return vim.loop.cwd()
                end,
            }
        elseif lang == "lua" then
            lspconf[lang].setup {
                root_dir = function()
                    return vim.loop.cwd()
                end,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {"vim"}
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                            }
                        },
                        telemetry = {
                            enable = false
                        }
                    }
                }
            }
        end
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError",       {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",     {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint",        {text = "", numhl = "LspDiagnosticsDefaultHint"})

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}
