-- Encoding
vim.opt.encoding = "utf-8"

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Global status
vim.laststatus = 3

-- Spelling
vim.opt.spell = false
vim.opt.spelllang = { "en" }
vim.opt.spellsuggest = "best,9"

-- Command height
vim.opt.cmdheight = 0

-- Show eol char
--vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"

-- Mouse? Sure, why not
vim.opt.mouse = "a"

-- Cursor
vim.opt.guicursor = ""

-- Selection
vim.opt.clipboard = "unnamedplus"

-- Indentation & Tab/Spaces
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 8

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
vim.opt.undolevels = 10000

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"

-- Colours / Display
vim.opt.signcolumn = "yes"
vim.opt.hidden = true
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

-- Improve the delay
vim.opt.updatetime = 200

-- Don't pass messages to |ins-completion-menu|
vim.opt.shortmess:append { W = true, I = true, c = true }

-- Colour column
vim.opt.colorcolumn = "80"

-- Popups
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup

-- Hide mode
vim.opt.showmode = false -- Dont show mode since we have a statusline

-- Timeout
vim.opt.timeoutlen = 300

-- Wildmenu
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.opt.shortmess:append { C = true }
end
