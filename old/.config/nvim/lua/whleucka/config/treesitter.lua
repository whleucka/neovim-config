require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "c",
        "lua",
        "php",
        "phpdoc",
        "go",
        "html",
        "css",
        "json",
        "bash",
        "python",
        "javascript",
        "rust",
        "comment",
        "gitcommit",
        "twig",
        "cpp",
        "vim",
        "regex",
    },
    context_commentstring = { enable = true, enable_autocmd = false },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        additional_vim_regex_highlighting = { "php" }
    },
    indent = { enable = true, disable = { "python" } },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<nop>",
            node_decremental = "<bs>",
        },
    },
}
