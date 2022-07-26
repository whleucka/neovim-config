-- Leade/Globals
vim.g.mapleader = " "

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Cursor
vim.opt.guicursor = ""

-- Spaces & Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Saving/Swap
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Indenting
vim.opt.smartindent = true

-- Colours
vim.opt.termguicolors = true

-- Command height
vim.opt.cmdheight = 1

-- Improve the delay
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|
vim.opt.shortmess:append("c")

-- Colour column
vim.opt.colorcolumn = "80"
