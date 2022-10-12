---@diagnostic disable: need-check-nil
local nnoremap = require("whleucka.remap").nnoremap
local inoremap = require("whleucka.remap").inoremap
local xnoremap = require("whleucka.remap").xnoremap
local vnoremap = require("whleucka.remap").vnoremap
local tmap = require("whleucka.remap").tmap

-- Quick save / exit
nnoremap("<leader>w", "<cmd> update!<CR>")
nnoremap("<leader>q", "<cmd> BufferClose<CR>")
nnoremap("<leader>x", "<cmd> qall<CR>")

-- Minimap

-- Formatting
nnoremap("<leader>f", "<cmd> LspZeroFormat<CR>")
nnoremap("p", "p=`]")

-- Quick source
nnoremap("<C-s>", "<cmd> so %<CR>")

-- Custom
--nnoremap("<leader>bb", "<cmd> lua require('whleucka.functions').bitcoin_price()<CR>")

-- Packer
nnoremap("<leader>ps", "<cmd> PackerSync<CR>")

-- Avoid Ex mode
nnoremap("Q", "<nop>")
-- Other annoying things
nnoremap("q", "<nop>")
nnoremap("<ESC>", "<ESC>:noh<CR><cmd> lua require('notify').dismiss()<CR>")

inoremap('jk', '<C-c>')
inoremap('kj', '<C-c>')

-- Break undo sequence
inoremap("$", "$<C-g>u")
inoremap(",", ",<C-g>u")
inoremap("(", "(<C-g>u")
inoremap(")", ")<C-g>u")
inoremap("[", "[<C-g>u")
inoremap("]", "]<C-g>u")

-- LSP
nnoremap("<leader>ca", "<cmd> lua vim.lsp.buf.code_action()<CR>")
nnoremap("<leader>rn", "<cmd> lua vim.lsp.buf.rename()<CR>")
-- Restart LSP
nnoremap("<leader>r", "<cmd> LspRestart<CR>")
-- Mason
nnoremap("<leader>M", "<cmd> Mason<CR>")
-- Diagnostics
nnoremap("<leader>T", "<cmd> TroubleToggle document_diagnostics<CR>")

-- Terminal
nnoremap([[<C-\>]], "<cmd> ToggleTerm direction=float<CR>")
nnoremap("<leader>th", "<cmd> ToggleTerm direction=horizontal size=15<CR>")
nnoremap("<leader>tv", "<cmd> ToggleTerm direction=vertical size=60<CR>")
nnoremap("<leader>tb", "<cmd> lua require('whleucka.terminal').bpytop_toggle()<CR>")
nnoremap("<leader>tt", "<cmd> lua require('whleucka.terminal').htop_toggle()<CR>")
nnoremap("<leader>tm", "<cmd> lua require('whleucka.terminal').matrix_toggle()<CR>")
nnoremap("<leader>tn", "<cmd> lua require('whleucka.terminal').ncdu_toggle()<CR>")
function _G.set_terminal_keymaps()
    tmap("<esc>", "<cmd> ToggleTermToggleAll<CR>")
    tmap("jk", [[<C-\><C-n>]])
    tmap("kj", [[<C-\><C-n>]])
end

-- Neo Git
nnoremap("<leader>gs", "<cmd> Neogit kind=split<CR>")
nnoremap("<leader>gc", "<cmd> Neogit commit<CR>")
nnoremap("<leader>gm", "<cmd> DiffviewOpen<CR>")

-- Telescope
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap("<leader><leader>", "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<leader>fm", "<cmd>lua require('telescope').extensions.media_files.media_files()<CR>")

-- File navigation
nnoremap("<leader>le", ":Lex 40<CR>")
nnoremap("<leader>e", "<cmd> NvimTreeToggle<CR>")
-- Split navigation
nnoremap("<leader>h", "<C-w><C-h>")
nnoremap("<leader>j", "<C-w><C-j>")
nnoremap("<leader>k", "<C-w><C-k>")
nnoremap("<leader>l", "<C-w><C-l>")

-- Buffer navigation
nnoremap("<leader>.", "<cmd>BufferNext<CR>")
nnoremap("<leader>,", "<cmd>BufferPrev<CR>")
nnoremap("<leader>1", "<cmd>BufferGoto 1<CR>")
nnoremap("<leader>2", "<cmd>BufferGoto 2<CR>")
nnoremap("<leader>3", "<cmd>BufferGoto 3<CR>")
nnoremap("<leader>4", "<cmd>BufferGoto 4<CR>")
nnoremap("<leader>5", "<cmd>BufferGoto 5<CR>")
nnoremap("<leader>6", "<cmd>BufferGoto 6<CR>")
nnoremap("<leader>7", "<cmd>BufferGoto 7<CR>")
nnoremap("<leader>8", "<cmd>BufferGoto 8<CR>")
nnoremap("<leader>9", "<cmd>BufferGoto 9<CR>")

-- Resize splits
nnoremap("<leader><Up>", ":resize +2<CR>")
nnoremap("<leader><Down>", ":resize -2<CR>")
nnoremap("<leader><Left>", ":vertical resize +2<CR>")
nnoremap("<leader><Right>", ":vertical resize -2<CR>")

-- Line movements
nnoremap("H", "^")
nnoremap("L", "$")
nnoremap("j", "gj")
nnoremap("k", "gk")

-- Reselect visual when indenting
vnoremap("<", "<gv")
xnoremap("<", "<gv")
vnoremap(">", ">gv")
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
xnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nnoremap("<leader>y", 'gg"+yG')
xnoremap("<leader>p", '"_dP')
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

-- Quickfix lists
nnoremap("q[", ":cprevious<CR>")
nnoremap("q]", ":cnext<CR>")
