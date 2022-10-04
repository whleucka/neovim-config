-- Nvim Tree position fixes
vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*',
    callback = function()
        if vim.bo.filetype == 'NvimTree' then
            require'bufferline.state'.set_offset(31, 'FileTree')
        end
    end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
    pattern = '*',
    callback = function()
        if vim.fn.expand('<afile>'):match('NvimTree') then
            require'bufferline.state'.set_offset(0)
        end
    end
})

local save_pos = vim.api.nvim_create_augroup("SaveIt", {clear = true})
vim.api.nvim_create_autocmd("BufRead", {
    desc = "Restore last cursor position",
    group = save_pos,
    pattern = '*',
    command = [[call setpos(".", getpos("'\""))]]
})

local packer_sync = vim.api.nvim_create_augroup("PackerSyncIt", {clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "Auto save plugins",
    group = packer_sync,
    pattern = 'plugins.lua',
    command = "source <afile> | PackerSync"
})

local leave = vim.api.nvim_create_augroup("LeaveIt", {clear = true})
vim.api.nvim_create_autocmd("VimLeave", {
    desc = "Set cursor position on exit",
    group = leave,
    pattern = '*',
    command = "wshada!"
})

local yank = vim.api.nvim_create_augroup("YankIt", {clear = true})
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Hightlight text on yank",
    group = yank,
    pattern = '*',
    command = [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]]
})

local term = vim.api.nvim_create_augroup("TerminalGroup", {clear = true})
vim.api.nvim_create_autocmd("TermOpen", {
    desc = "Terminal keymaps",
    group = term,
    pattern = 'term://*toggleterm#*',
    command = [[silent! lua set_terminal_keymaps()]]
})

local group = vim.api.nvim_create_augroup('MyCustomNeogitEvents', { clear = true })
vim.api.nvim_create_autocmd('User', {
    desc = "Close neogit on push complete",
    pattern = 'NeogitPushComplete',
    group = group,
    callback = require('neogit').close,
})

-- Integrate lsp progress with nvim-notify
--vim.api.nvim_create_autocmd({'UIEnter'}, {
--    once = true,
--    callback = function()
--        local Spinner = require('whleucka.spinner')
--        local spinners = {}
--
--        local function format_msg(msg, percentage)
--            msg = msg or ''
--            if not percentage then
--                return msg
--            end
--            return string.format('%2d%%\t%s', percentage, msg)
--        end
--
--        vim.api.nvim_create_autocmd({'User'}, {
--            pattern = {'LspProgressUpdate'},
--            group = vim.api.nvim_create_augroup('LSPNotify', {clear = true}),
--            desc = 'LSP progress notifications',
--            callback = function()
--                for _, c in ipairs(vim.lsp.get_active_clients()) do
--                    for token, ctx in pairs(c.messages.progress) do
--                        if not spinners[c.id] then
--                            spinners[c.id] = {}
--                        end
--                        local s = spinners[c.id][token]
--                        if not ctx.done then
--                            if not s then
--                                spinners[c.id][token] = Spinner(
--                                format_msg(ctx.message, ctx.percentage), vim.log.levels.INFO, {
--                                    title = ctx.title and string.format('%s: %s', c.name, ctx.title) or c.name
--                                })
--                            else
--                                s:update(format_msg(ctx.message, ctx.percentage))
--                            end
--                        else
--                            c.messages.progress[token] = nil
--                            if s then
--                                s:done(ctx.message or 'Complete', nil, {
--                                    icon = '',
--                                })
--                                spinners[c.id][token] = nil
--                            end
--                        end
--                    end
--                end
--            end,
--        })
--    end,
--})

-- Will work in v0.8.0
local lsp = vim.api.nvim_create_augroup("LSP", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp,
    callback = function()
        print("🕷️ With great power comes great responsibility")
    end,
})
-- Folds
local folds = vim.api.nvim_create_augroup("FoldIt", {clear = true})
vim.api.nvim_create_autocmd("BufReadPost,FileReadPost", {
    group = folds,
    pattern = '*',
    command = "normal zR"
})
