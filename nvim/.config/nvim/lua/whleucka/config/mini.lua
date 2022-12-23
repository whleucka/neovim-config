require('mini.ai').setup() --extend and create a/i textobjects
-- require('mini.align').setup() --align text interactively
-- require('mini.animate').setup() --Animate common Neovim actions
-- require('mini.base16').setup() --base16 colorscheme creation
-- require('mini.bufremove').setup() --Remove buffers
require('mini.comment').setup() --Comment
-- require('mini.completion').setup() --Completion and signature help
-- require('mini.cursorword').setup() --Autohighlight word under cursor
-- require('mini.doc') .setup()--generate Neovim help files
-- require('mini.fuzzy').setup() --fuzzy matching
require('mini.indentscope').setup() --Visualize and operate on indent scope
require('mini.jump').setup() --jump forward/backward to a single character
-- require('mini.jump2d').setup() --jump within visible lines
-- require('mini.map').setup() --window with buffer text overview
-- require('mini.misc').setup() --miscellaneous functions
-- require('mini.pairs').setup() --autopairs
-- require('mini.sessions').setup() --Session management
local starter = require('mini.starter') --Start screen
starter.setup({
    evaluate_single = true,
    items = {
        starter.sections.builtin_actions(),
        starter.sections.recent_files(10, false),
        starter.sections.recent_files(10, true),
        -- Use this if you set up 'mini.sessions'
        starter.sections.sessions(5, true)
    },
    content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
        starter.gen_hook.padding(3, 2),
    },
})
-- require('mini.statusline').setup() --Statusline
require('mini.surround').setup() --Surround actions
-- require('mini.tabline').setup() --Tabline
-- require('mini.test') .setup()--test Neovim plugins
-- require('mini.trailspace').setup() --Trailspace (highlight and remove)
