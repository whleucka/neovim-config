local wk = require("which-key")

wk.register({
    c = { "<cmd> BufferClose<cr>", "Close Buffer" },
    e = { "<cmd> NvimTreeToggle<cr>", "Toggle NvimTree" },
    o = { "<cmd> NvimTreeFocus<cr>", "Focus NvimTree" },
    q = { "<cmd> q<cr>", "Quit Buffer" },
    w = { "<cmd> update!<cr>", "Write Buffer" },
    x = { "<cmd> qall<cr>", "Quit All Buffers" },
    ['-'] = { "<cmd>sp<cr>", "Split screen horizontally" },
    ['='] = { "<cmd>vs<cr>", "Split screen veritcally" },
    [','] = { "^", "Move to Beginning of Line" },
    ['.'] = { "$", "Move to End of Line" },
    d = {
      name = "Diagnostics",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    },
    t = {
        name="Test",
        t = { "<cmd> lua require('neotest').run.run()<CR>", "Test single method" },
        f = { "<cmd> lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Test file" },
        T = { "<cmd> lua require('neotest').run.run({ suite = true })<CR>", "Test suite" },
        S = { "<cmd> lua require('neotest').run.stop()<CR>", "Stop the nearest test" },
        o = { "<cmd> lua require('neotest').output_panel.toggle({ enter = true })<CR>", "Toggle test output" },
        s = { "<cmd> lua require('neotest').summary.toggle({ enter = true })<CR>", "Toggle test summary" },
    },
    m = {
        name = "Mason",
        l = { "<cmd> MasonLog<cr>", "Log" },
        m = { "<cmd> Mason<cr>", "Mason" },
    },
    g = {
        name = "Git",
        s = { "<cmd> Neogit kind=split<cr>", "Neogit" },
    },
    ['\\'] = {
        name = "Terminal",
        ['\\'] = { "<cmd> ToggleTerm direction=float<cr>", "Floating" },
        b = { "<cmd> lua require('whleucka.core.terminal').bpytop_toggle()<cr>", "Open bpytop" },
        h = { "<cmd> ToggleTerm direction=horizontal size=15<cr>", "Horizontal" },
        m = { "<cmd> lua require('whleucka.core.terminal').matrix_toggle()<cr>", "Open cmatrix" },
        n = { "<cmd> lua require('whleucka.core.terminal').ncdu_toggle()<cr>", "Open ncdu" },
        t = { "<cmd> lua require('whleucka.core.terminal').htop_toggle()<cr>", "Open htop" },
        g = { "<cmd> lua require('whleucka.core.terminal').gpterm_toggle()<cr>", "Open gpterm" },
        v = { "<cmd> ToggleTerm direction=vertical size=60<cr>", "Vertical" },
    },
    f = {
        name = "Find",
        b = { "<cmd>Telescope buffers<cr>", "Buffer" },
        f = { "<cmd>Telescope find_files<cr>", "File" },
        g = { "<cmd>Telescope git_files<cr>", "Git File" },
        o = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
        w = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    },
    b = {
        name = "Buffers",
        [','] = { "<cmd>BufferMovePrevious<cr>", "Move Buffer Next" },
        ['.'] = { "<cmd>BufferMoveNext<cr>", "Move Buffer Prev" },
        ['0'] = { "<cmd>BufferLast<cr>", "Goto Last Buffer" },
        ['1'] = { "<cmd>BufferGoto 1<cr>", "Goto Buffer 1" },
        ['2'] = { "<cmd>BufferGoto 2<cr>", "Goto Buffer 2" },
        ['3'] = { "<cmd>BufferGoto 3<cr>", "Goto Buffer 3" },
        ['4'] = { "<cmd>BufferGoto 4<cr>", "Goto Buffer 4" },
        ['5'] = { "<cmd>BufferGoto 5<cr>", "Goto Buffer 5" },
        ['6'] = { "<cmd>BufferGoto 6<cr>", "Goto Buffer 6" },
        ['7'] = { "<cmd>BufferGoto 7<cr>", "Goto Buffer 7" },
        ['8'] = { "<cmd>BufferGoto 8<cr>", "Goto Buffer 8" },
        ['9'] = { "<cmd>BufferGoto 9<cr>", "Goto Buffer 9" },
    },
    z = {
        name = "Lazy",
        c = { "<cmd> Lazy clean<cr>", "Clean" },
        i = { "<cmd> Lazy install<cr>", "Install" },
        s = { "<cmd> Lazy sync<cr>", "Synchronize" },
        u = { "<cmd> Lazy update<cr>", "Update" },
        p = { "<cmd> Lazy profile<cr>", "Profile" },
        h = { "<cmd> Lazy help<cr>", "Help" },
        d = { "<cmd> Lazy debug<cr>", "Debug" },
        l = { "<cmd> Lazy log<cr>", "Log" },
        z = { "<cmd> Lazy health<cr>", "Health" },
        e = { "<cmd> Lazy clear<cr>", "Clear" },
    },
    r = {
        name = "Trouble",
        c = { "<cmd> TroubleClose<cr>", "Trouble" },
        d = { "<cmd> TroubleToggle document_diagnostics<cr>", "Document" },
        t = { "<cmd> TroubleToggle<cr>", "Trouble" },
    },
    s = {
        name = "LSP",
        a = { function() vim.lsp.buf.code_action() end, "Code Action" },
        f = { function() vim.lsp.buf.format {async = true} end, "Format" },
        k = { function() vim.lsp.buf.signature_help() end, "Signature Help" },
        r = { function() vim.lsp.buf.rename() end, "Rename" },
        s = {"<cmd>LspStart<cr>", "LSP Start" },
        p = {"<cmd>LspStop<cr>", "LSP Stop" },
        i = {"<cmd>LspInfo<cr>", "LSP Info" },
    }
}, { prefix = "<leader>"} )

local keymap_v = {
    name = "Debug",
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
}
wk.register(keymap_v, {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
})
