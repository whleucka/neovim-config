local nnoremap = require("whleucka.remap").nnoremap
local inoremap = require("whleucka.remap").inoremap

-- Quick save / exit
nnoremap("<leader>w", ":update<CR>")
nnoremap("<leader>q", ":q<CR>")
nnoremap("<leader>c", ":BufferDelete<CR>")
nnoremap("<leader>f", ":LspZeroFormat<CR>")
nnoremap("<leader>R", ":LspRestart<CR>")
nnoremap("<leader>S", ":so<CR>")
nnoremap("<ESC>", ":noh<CR>")

-- Terminal
nnoremap("<C-\\>", ":ToggleTerm direction=float<CR>")
nnoremap("<leader>tb", "<cmd> lua require('whleucka.terminal').bpytop_toggle()<CR>")
nnoremap("<leader>th", "<cmd> lua require('whleucka.terminal').htop_toggle()<CR>")

-- Packer
nnoremap("<leader>ps", ":PackerSync<CR>")

-- Diagnostics
nnoremap("<leader>t", ":TroubleToggle document_diagnostics<CR>")

-- Fugitive
nnoremap("<leader>gs", ":Git<CR>")

-- Telescope
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
nnoremap("<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<CR>")

-- Mason
nnoremap("<leader>I", ":Mason<CR>")

-- Exit insert
inoremap("jk", "<ESC>");
inoremap("kj", "<ESC>");

-- File navigation
nnoremap("<leader>e", ":NvimTreeToggle<CR>")

-- Split navigation
nnoremap("<leader>h", "<C-w><C-h>")
nnoremap("<leader>j", "<C-w><C-j>")
nnoremap("<leader>k", "<C-w><C-k>")
nnoremap("<leader>l", "<C-w><C-l>")
nnoremap("<leader><leader>", "<C-w><C-p>")

-- Tabs
nnoremap("H", ":BufferPrev<CR>")
nnoremap("L", ":BufferNext<CR>")
