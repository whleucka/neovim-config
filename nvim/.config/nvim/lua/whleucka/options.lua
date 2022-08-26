-- Leade/Globals
vim.g.mapleader = " "
-- DAP
vim.g.dap_virtual_text = true

-- Encoding
vim.opt.encoding = "utf-8"

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Show eol char
vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

-- Mouse? Sure, why not
vim.opt.mouse = "a"

-- Cursor
vim.opt.guicursor = ""

-- Selection
vim.cmd[[set clipboard+=unnamedplus]]

-- Indentation & Tab/Spaces
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 5

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Folds
vim.wo.foldenable = false
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1

-- Saving/Swap
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/.undodir"
vim.opt.undofile = true

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.showmatch = true

-- Colours / Display
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.hidden = true
vim.opt.completeopt = { "menu" , "menuone" , "noselect", "noinsert" }

-- Command height
vim.opt.cmdheight = 1

-- Improve the delay
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|
vim.opt.shortmess:append("c")

-- Colour column
vim.opt.colorcolumn = "80"
