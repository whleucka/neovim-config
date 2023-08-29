-- ************************
-- WELCOME TO WILL'S CONFIG
-- ************************
--
-- An excellent plugin collection
-- Spared no expense.
--
-- Map leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Plugins
require("whleucka.core.lazy")
-- Nvim options
require("whleucka.core.options")
-- Key mappings
require("whleucka.core.mappings")
-- LSP configuration
require("whleucka.core.lsp")
-- Auto commands
require("whleucka.core.autocmds")
