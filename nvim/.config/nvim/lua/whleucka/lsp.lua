-- Setup & Configure LSP
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Ignore vim global messages
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
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
