local nnoremap = require("whleucka.remap").nnoremap

-- Quick save / exit
nnoremap("<leader>w", ":update!<CR>")
nnoremap("<leader>q", ":qall<CR>")
nnoremap("<leader>c", ":bd<CR>")

-- Telescope
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
nnoremap("<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
