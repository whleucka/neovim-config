local nnoremap = require("whleucka.remap").nnoremap
local inoremap = require("whleucka.remap").inoremap
local bitcoin_price = require("whleucka.functions").bitcoin_price

-- Quick save / exit
nnoremap("<leader>w", "<cmd> update<CR>")
nnoremap("<leader>q", "<cmd> q<CR>")
nnoremap("<leader>c", "<cmd> BufferDelete<CR>")
nnoremap("<leader>f", "<cmd> LspZeroFormat<CR>")
nnoremap("<leader>R", "<cmd> LspRestart<CR>")
nnoremap("<leader>S", "<cmd> so<CR>")
nnoremap("<leader>b", "<cmd> lua bitcoin_price()<CR>")
nnoremap("<ESC>", "<cmd> noh<CR>")

-- Terminal
nnoremap("<C-\\>", "<cmd> ToggleTerm direction=float<CR>")
nnoremap("<leader>t", "<cmd> ToggleTerm<CR>")
nnoremap("<leader>tb", "<cmd> lua require('whleucka.terminal').bpytop_toggle()<CR>")
nnoremap("<leader>th", "<cmd> lua require('whleucka.terminal').htop_toggle()<CR>")
nnoremap("<leader>tm", "<cmd> lua require('whleucka.terminal').matrix_toggle()<CR>")

-- Packer
nnoremap("<leader>ps", "<cmd> PackerSync<CR>")

-- Diagnostics
nnoremap("<leader>T", "<cmd> TroubleToggle document_diagnostics<CR>")

-- Fugitive
nnoremap("<leader>gs", "<cmd> Git<CR>")

-- Telescope
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
nnoremap("<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<CR>")

-- Mason
nnoremap("<leader>I", "<cmd> Mason<CR>")

-- Exit insert
inoremap("jk", "<ESC>");
inoremap("kj", "<ESC>");

-- File navigation
nnoremap("<leader>e", "<cmd> NvimTreeToggle<CR>")

-- Split navigation
nnoremap("<leader>h", "<C-w><C-h>")
nnoremap("<leader>j", "<C-w><C-j>")
nnoremap("<leader>k", "<C-w><C-k>")
nnoremap("<leader>l", "<C-w><C-l>")
nnoremap("<leader><leader>", "<C-w><C-p>")

-- Tabs
nnoremap("H", "<cmd> BufferPrev<CR>")
nnoremap("L", "<cmd> BufferNext<CR>")
