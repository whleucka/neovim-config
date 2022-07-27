-- Nvim Tree fixes
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

-- Restore last cursor position
vim.api.nvim_create_autocmd("BufRead", {
    pattern = '*',
    command = [[call setpos(".", getpos("'\""))]]
})

-- Auto save plugins
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = 'plugins.lua',
    command = "source <afile> | PackerSync"
})

-- Set cursor position on exit
vim.api.nvim_create_autocmd("VimLeave", {
    pattern = '*',
    command = "wshada!"
})

-- Hightlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = '*',
    command = [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]]
})
