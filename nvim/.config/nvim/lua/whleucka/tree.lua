require("nvim-tree").setup({
    open_on_setup = false,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = false,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    renderer = {
        group_empty = false,
    },
    filters = {
        custom = {
            "^.git$",
        },
        dotfiles = false,
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 400,
    },
    actions = {
        open_file = {
            quit_on_open = true
        }
    }
})
