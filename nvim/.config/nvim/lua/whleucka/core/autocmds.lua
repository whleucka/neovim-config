-- Nvim Tree position fixes
vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*',
    callback = function()
        if vim.bo.filetype == 'NvimTree' then
            require'bufferline.api'.set_offset(31, 'FileTree')
        end
    end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
    pattern = '*',
    callback = function()
        if vim.fn.expand('<afile>'):match('NvimTree') then
            require'bufferline.api'.set_offset(0)
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

local ws = vim.api.nvim_create_augroup("WhiteSpace", {clear = true})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = '*',
  desc = "Remove white space",
  group = ws,
  command = [[%s/\s\+$//e]],
})

-- Works in v0.8.0
--local lsp = vim.api.nvim_create_augroup("LSP", { clear = true })
--vim.api.nvim_create_autocmd("LspAttach", {
--    group = lsp,
--    callback = function()
--        print("🕷️ With great power comes great responsibility")
--    end,
--})

local folds = vim.api.nvim_create_augroup("FoldIt", {clear = true})
vim.api.nvim_create_autocmd("BufReadPost,FileReadPost", {
    group = folds,
    desc = "Auto unfold buff",
    pattern = '*',
    command = "normal zR"
})
