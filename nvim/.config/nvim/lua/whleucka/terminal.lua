local M = {}

local Terminal  = require('toggleterm.terminal').Terminal
-- System monitors
local bpytop = Terminal:new({ cmd = "bpytop", hidden = true, direction = "float" })
local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })
local matrix = Terminal:new({ cmd = "cmatrix -ba -u 2", hidden = true, direction = "float" })
local ncdu = Terminal:new({ cmd = "ncdu .", hidden = true, direction = "float" })

function M.bpytop_toggle()
    bpytop:toggle()
end

function M.htop_toggle()
    htop:toggle()
end

function M.matrix_toggle()
    matrix:toggle()
end

function M.ncdu_toggle()
    ncdu:toggle()
end

return M
