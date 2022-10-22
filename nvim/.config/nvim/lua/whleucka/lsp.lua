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

-- VScode-style pictograms
local cmp = require('cmp')
local lspkind = require('lspkind')
local cmp_config = lsp.defaults.cmp_config({
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            before = function (entry, vim_item)
                return vim_item
            end
        })
    }
})
cmp.setup(cmp_config)

-- Diagnostic messages
vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '■' '●', '▎', 'x'
    },
    signs = true,
    update_in_insert = false,
    underline = true,
})

