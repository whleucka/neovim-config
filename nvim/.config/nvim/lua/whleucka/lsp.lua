-- Setup & Configure LSP
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Ignore vim global messages
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            workspace = {
                ignoreDir = { ".undodir" }
            },
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.setup()

-- Diagnostic messages
vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '■' '●', '▎', 'x'
    },
    signs = true,
    update_in_insert = false,
    underline = true,
})
