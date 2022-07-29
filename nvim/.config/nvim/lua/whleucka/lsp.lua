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
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
})

-- Goto def in split
local function goto_definition(split_cmd)
    local util = vim.lsp.util
    local log = require("vim.lsp.log")
    local api = vim.api

    -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
        local handler = function(_, result, ctx)
            if result == nil or vim.tbl_isempty(result) then
                local _ = log.info() and log.info(ctx.method, "No location found")
                return nil
            end

            if split_cmd then
                vim.cmd(split_cmd)
            end

            if vim.tbl_islist(result) then
                util.jump_to_location(result[1])

                if #result > 1 then
                    util.set_qflist(util.locations_to_items(result))
                    api.nvim_command("copen")
                    api.nvim_command("wincmd p")
                end
            else
                util.jump_to_location(result)
            end
        end

        return handler
    end

    vim.lsp.handlers["textDocument/definition"] = goto_definition('split')


    vim.diagnostic.config({
        virtual_text = {
            prefix = '●', -- Could be '■' '●', '▎', 'x'
        }
    })
