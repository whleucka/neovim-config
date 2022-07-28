-- Nvim Tree fixes
local nvim_tree = vim.api.nvim_create_augroup("NvimTree", {clear = true})
vim.api.nvim_create_autocmd('BufWinEnter', {
    group = nvim_tree,
    pattern = '*',
    callback = function()
        if vim.bo.filetype == 'NvimTree' then
            require'bufferline.state'.set_offset(31, 'FileTree')
        end
    end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
    group = nvim_tree,
    pattern = '*',
    callback = function()
        if vim.fn.expand('<afile>'):match('NvimTree') then
            require'bufferline.state'.set_offset(0)
        end
    end
})

-- Restore last cursor position
local save_pos = vim.api.nvim_create_augroup("SaveIt", {clear = true})
vim.api.nvim_create_autocmd("BufRead", {
    group = save_pos,
    pattern = '*',
    command = [[call setpos(".", getpos("'\""))]]
})

-- Auto save plugins
local packer_sync = vim.api.nvim_create_augroup("PackerSyncIt", {clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
    group = packer_sync,
    pattern = 'plugins.lua',
    command = "source <afile> | PackerSync"
})

-- Set cursor position on exit
local leave = vim.api.nvim_create_augroup("Leave", {clear = true})
vim.api.nvim_create_autocmd("VimLeave", {
    group = leave,
    pattern = '*',
    command = "wshada!"
})

-- Hightlight text on yank
local yank = vim.api.nvim_create_augroup("YankThat", {clear = true})
vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank,
    pattern = '*',
    command = [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]]
})

-- Folds
--local folds = vim.api.nvim_create_augroup("FoldIt", {clear = true})
--vim.api.nvim_create_autocmd("BufReadPost,FileReadPost", {
--    group = folds,
--    pattern = '*',
--    command = "normal zR"
--})
