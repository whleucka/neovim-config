vim.opt.background = "dark"

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Transparent
--vim.g.tokyonight_transparent = true
--vim.g.tokyonight_transparent_sidebar = true


-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
vim.cmd[[hi BufferTabpageFill guibg=NONE]]
