local M = {}

function M.setup(_)
    -- Don't forget to install debugpy
    require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
end

return M
