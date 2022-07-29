local M = {}

function M.bitcoin_price()
    vim.fn.jobstart({"go", "run", "bitcoin"}, {
        on_stdout = function(_, data)
            if data then
                for _,line in ipairs(data) do
                    if line ~= nil then
                        print(line)
                    end
                    break
                end
            end
        end,
    })
end

return M
