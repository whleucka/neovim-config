---@diagnostic disable: need-check-nil
local nnoremap = require("whleucka.core.remap").nnoremap
local inoremap = require("whleucka.core.remap").inoremap
local xnoremap = require("whleucka.core.remap").xnoremap
local vnoremap = require("whleucka.core.remap").vnoremap
local tmap = require("whleucka.core.remap").tmap

-- Avoid Ex mode
nnoremap("Q", "<nop>")
-- Other annoying things
nnoremap("q", "<nop>")
nnoremap("<Enter>", "<cmd>noh<CR><cmd> lua require('notify').dismiss()<CR>")

inoremap('jk', '<C-c>')
inoremap('kj', '<C-c>')

-- Break undo sequence
inoremap("$", "$<C-g>u")
inoremap(",", ",<C-g>u")
inoremap("(", "(<C-g>u")
inoremap(")", ")<C-g>u")
inoremap("[", "[<C-g>u")
inoremap("]", "]<C-g>u")
inoremap("-", "-<C-g>u")
inoremap("_", "_<C-g>u")
inoremap(";", ";<C-g>u")

-- Formatting
nnoremap("<C-f>", function() vim.lsp.buf.format { async = true } end)
vnoremap("<C-f>", function() vim.lsp.buf.format { async = true } end)

-- Terminal
function _G.set_terminal_keymaps()
    tmap("<esc>", "<cmd> ToggleTermToggleAll<CR>")
    tmap("jk", [[<C-\><C-n>]])
    tmap("kj", [[<C-\><C-n>]])
end

-- Resize splits
nnoremap("<A-Down>", ":resize +2<CR>")
nnoremap("<A-Up>", ":resize -2<CR>")
nnoremap("<A-Left>", ":vertical resize +2<CR>")
nnoremap("<A-Right>", ":vertical resize -2<CR>")

-- Line movements
nnoremap("H", "^")
nnoremap("L", "$")
-- Improve movements on wrapped lines
nnoremap("j", "gj")
nnoremap("k", "gk")

-- Reselect visual when indenting
vnoremap("<", "<gv")
xnoremap("<", "<gv")
vnoremap(">", ">gv")
xnoremap(">", ">gv")

-- Quickfix lists
nnoremap("[q", "<cmd>cprevious<CR>zz")
nnoremap("]q", "<cmd>cnext<CR>zz")
-- Location lists
nnoremap("[l", "<cmd>lprevious<CR>zz")
nnoremap("]l", "<cmd>lnext<CR>zz")

-- Primeagen stuff
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
-- Keep it centered
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
