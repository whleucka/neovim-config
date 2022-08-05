local nnoremap = require("whleucka.remap").nnoremap
local inoremap = require("whleucka.remap").inoremap
local xnoremap = require("whleucka.remap").xnoremap
local vnoremap = require("whleucka.remap").vnoremap

-- Quick save / exit
nnoremap("<leader>le", ":Lex 50<CR>")
nnoremap("<leader>w", "<cmd> update<CR>")
nnoremap("<leader>q", "<cmd> q<CR>")
nnoremap("<leader>c", "<cmd> BufferDelete<CR>")
nnoremap("<leader>f", "<cmd> LspZeroFormat<CR>")
nnoremap("<leader>r", "<cmd> LspRestart<CR>")
nnoremap("<leader>b", "<cmd> lua require('whleucka.functions').bitcoin_price()<CR>")
nnoremap("<ESC>", "<cmd> noh<CR>")

nnoremap("<leader>ca", "<cmd> lua vim.lsp.buf.code_action()<CR>")

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
inoremap("jk", "<ESC>")
inoremap("kj", "<ESC>")

-- File navigation
nnoremap("<leader>e", "<cmd> NvimTreeToggle<CR>")

-- Avoid Ex mode
nnoremap("Q", "<nop>")

-- Break undo sequence
inoremap(".", ".<C-g>u")
inoremap("!", "!<C-g>u")
inoremap("?", "?<C-g>u")
inoremap(",", ",<C-g>u")
inoremap("$", "$<C-g>u")
inoremap("(", "(<C-g>u")
inoremap(")", ")<C-g>u")
inoremap("[", "[<C-g>u")
inoremap("]", "]<C-g>u")

-- Split navigation
nnoremap("<leader>h", "<C-w><C-h>")
nnoremap("<leader>j", "<C-w><C-j>")
nnoremap("<leader>k", "<C-w><C-k>")
nnoremap("<leader>l", "<C-w><C-l>")
nnoremap("<leader><leader>", "<C-w><C-p>")

-- Resize splits
nnoremap("<A-Up>", ":resize +2<CR>")
nnoremap("<A-Down>", ":resize -2<CR>")
nnoremap("<A-Left>", ":vertical resize +2<CR>")
nnoremap("<A-Right>", ":vertical resize -2<CR>")

-- Line movements
nnoremap("H", "^")
nnoremap("L", "$")
nnoremap("j", "gj")
nnoremap("k", "gk")

-- Stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv")
-- Reselect visual when indenting
xnoremap("<", "<gv")
xnoremap(">", ">gv")

-- ThePrimeagen (Yayayayayayaya)
-- Move visual lines up or down with J,K
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
-- Keeping it centered
nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
-- Yank/Paste/Delete
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nnoremap("<leader>y", 'gg"+yG')
xnoremap("<leader>p", '"_dP')
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

-- Tabs
nnoremap("<M-,>", "<cmd> BufferPrev<CR>")
nnoremap("<M-.>", "<cmd> BufferNext<CR>")

-- Quickfix lists
nnoremap("[q", ":cprevious<CR>")
nnoremap("]q", ":cnext<CR>")
