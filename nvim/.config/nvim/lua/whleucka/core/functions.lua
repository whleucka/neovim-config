local M = {}

function M.bitcoin_price()
    vim.fn.jobstart({"go", "run", "bitcoin"}, {
        stdout_buffered = true,
        on_stdout = function(_, data)
            if data then
                vim.notify(data, "SUCCESS", {
                    title = "Current Bitcoin USD"
                })
            end
        end
    })
end

return M
