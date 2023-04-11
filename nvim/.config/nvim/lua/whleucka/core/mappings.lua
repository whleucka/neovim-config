---@diagnostic disable: need-check-nil
local nnoremap = require("whleucka.core.remap").nnoremap
local inoremap = require("whleucka.core.remap").inoremap
local xnoremap = require("whleucka.core.remap").xnoremap
local vnoremap = require("whleucka.core.remap").vnoremap
local tmap = require("whleucka.core.remap").tmap

-- Avoid Ex mode
nnoremap("Q", "<nop>")
-- Other annoying things
nnoremap("<Esc>", "<cmd>noh<CR><cmd> lua require('notify').dismiss()<CR>")
inoremap('jk', '<C-c>')
inoremap('kj', '<C-c>')

-- Soprano search (music)
--nnoremap("<F10>", "<cmd>lua require('soprano').search()<cr>")

-- Find git files
nnoremap("<C-p>", "<cmd>Telescope git_files<cr>")

-- Break undo sequence
inoremap("$", "$<C-g>u")
inoremap(",", ",<C-g>u")
inoremap(".", ".<C-g>u")
inoremap(";", ";<C-g>u")

-- Terminal
function _G.set_terminal_keymaps()
    tmap("<esc>", "<cmd> ToggleTermToggleAll<CR>")
    tmap("jk", [[<C-\><C-n>]])
    tmap("kj", [[<C-\><C-n>]])
end

-- Resize splits
nnoremap("<A-Down>", ":resize +1<cr>")
nnoremap("<A-Up>", ":resize -1<cr>")
nnoremap("<A-Left>", ":vertical resize +1<cr>")
nnoremap("<A-Right>", ":vertical resize -1<cr>")

-- Quick tab movements
nnoremap("H", "<cmd>BufferPrevious<cr>")
nnoremap("L", "<cmd>BufferNext<cr>")

-- Improve movements on wrapped lines
nnoremap("j", "gj")
nnoremap("k", "gk")

-- Paste over currently selected text wihtout yanking it
vnoremap("p", '"_dP')

-- Reselect visual when indenting
vnoremap("<", "<gv")
xnoremap("<", "<gv")
vnoremap(">", ">gv")
xnoremap(">", ">gv")

-- Move selected line / block of text
xnoremap("K", ":move '<-2<CR>gv-gv")
xnoremap("J", ":move '>+1<CR>gv-gv")

-- Quickfix lists
nnoremap("q[", "<cmd>cprevious<CR>zz")
nnoremap("q]", "<cmd>cnext<CR>zz")

-- Keep it centered
nnoremap("J", "mzJ`z") -- join lines fix
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
