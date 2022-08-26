---@diagnostic disable: need-check-nil
local nnoremap = require("whleucka.remap").nnoremap
local inoremap = require("whleucka.remap").inoremap
local xnoremap = require("whleucka.remap").xnoremap
local vnoremap = require("whleucka.remap").vnoremap
local tmap = require("whleucka.remap").tmap

-- Quick save / exit
nnoremap("<leader>w", "<cmd> update!<CR>")
nnoremap("<leader>q", "<cmd> q<CR>")
nnoremap("<leader>c", "<cmd> BufferDelete<CR>")

-- Formatting
nnoremap("<leader>f", "<cmd> LspZeroFormat<CR>")

-- Quick source
nnoremap("<C-s>", "<cmd> so %<CR>")

-- Custom
nnoremap("<leader>B", "<cmd> lua require('whleucka.functions').bitcoin_price()<CR>")

-- LSP
nnoremap("<leader>ca", "<cmd> lua vim.lsp.buf.code_action()<CR>")
nnoremap("<leader>rn", "<cmd> lua vim.lsp.buf.rename()<CR>")
-- Restart LSP
nnoremap("<leader>r", "<cmd> LspRestart<CR>")

-- DAP
nnoremap("<leader>dt", "<cmd>lua require'dapui'.toggle()<CR>")
nnoremap("<F8>", "<cmd>lua require'dap'.continue()<CR>")
nnoremap("<F9>", "<cmd>lua require'dap'.step_over()<CR>")
nnoremap("<F10>", "<cmd>lua require'dap'.step_into()<CR>")
nnoremap("<F11>", "<cmd>lua require'dap'.step_out()<CR>")
nnoremap("<F12>", "<cmd> DapTerminate<CR>")
nnoremap("<leader>;", "<cmd>lua require'dap.ui.widgets'.hover()<CR>")
nnoremap("<leader>df", "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")
nnoremap("bp", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
nnoremap("<leader>dc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>")

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

-- Packer
nnoremap("<leader>ps", "<cmd> PackerSync<CR>")

-- Diagnostics
nnoremap("<leader>T", "<cmd> TroubleToggle document_diagnostics<CR>")

-- Neo Git
nnoremap("<leader>gs", "<cmd> Neogit kind=split<CR>")
nnoremap("<leader>gc", "<cmd> Neogit commit<CR>")

-- Telescope
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap("<leader><leader>", "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<leader>fm", "<cmd>lua require('telescope').extensions.media_files.media_files()<CR>")

-- Mason
nnoremap("<leader>I", "<cmd> Mason<CR>")

-- Exit insert
inoremap("jk", "<ESC>")
inoremap("kj", "<ESC>")

-- File navigation
nnoremap("<leader>le", ":Lex 40<CR>")
nnoremap("<leader>e", "<cmd> NvimTreeToggle<CR>")

-- Avoid Ex mode
nnoremap("Q", "<nop>")
-- Other annoying things
nnoremap("q", "<nop>")
nnoremap("<ESC>", "<cmd> noh<CR>")

-- Break undo sequence
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

-- Buffer navigation
nnoremap("<leader>.", "<cmd>BufferNext<CR>")
nnoremap("<leader>,", "<cmd>BufferPrev<CR>")

-- Resize splits
nnoremap("<Up>", ":resize +2<CR>")
nnoremap("<Down>", ":resize -2<CR>")
nnoremap("<Left>", ":vertical resize +2<CR>")
nnoremap("<Right>", ":vertical resize -2<CR>")

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

-- Indenting
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Quickfix lists
nnoremap("q[", ":cprevious<CR>")
nnoremap("q]", ":cnext<CR>")
