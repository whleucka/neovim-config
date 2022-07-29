local M = {}

function M.bitcoin_price()
    vim.fn.jobstart({"go", "run", "bitcoin"}, {
        stdout_buffered = true,
        on_stdout = function(_, data)
            if data then
                for _,line in ipairs(data) do
                    if line ~= nil then
                        vim.notify(line)
                    end
                    break
                end
            end
        end,
    })
end

return M
