local M = {}

local Terminal  = require('toggleterm.terminal').Terminal
local bpytop = Terminal:new({ cmd = "bpytop", hidden = true, direction = "float" })
local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })

function M.bpytop_toggle()
    bpytop:toggle()
end

function M.htop_toggle()
    htop:toggle()
end

return M
