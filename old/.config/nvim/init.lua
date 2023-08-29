-- Load my plugin :)
require("whleucka")

-- easy-i3-neovim-nav
vim.cmd[[
call serverstart(tempname())
let &titlestring="nvim %F -- [" . v:servername . "]"
set title
]]
