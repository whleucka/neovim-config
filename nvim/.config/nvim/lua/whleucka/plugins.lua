local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer, close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Protected call to make sure that packer is installed
local status_ok, packer = pcall(require, "packer")

if not status_ok then
    return
end

return packer.startup({function(use)
    -- My custom plugins

    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Cache plugins
    use "lewis6991/impatient.nvim"

    -- Theme
    use "folke/tokyonight.nvim"

    -- Git signs 
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Notifications
    use {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end
    }

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'nvim-lua/lsp_extensions.nvim'},
            {'ray-x/lsp_signature.nvim',
            config = function()
                require("lsp_signature").setup{}
            end},
            { "rcarriga/nvim-dap-ui",
            requires = {
                {"mfussenegger/nvim-dap"},
                {"mfussenegger/nvim-dap-python"},
                {'nvim-telescope/telescope-dap.nvim'},
                {'theHamsta/nvim-dap-virtual-text'}
            },
            config = function()
                -- require("dapui").setup{}
                require("dap-python").setup('/usr/bin/python')
                vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
                local dap = require('dap')
                dap.adapters.lldb = {
                    type = 'executable',
                    command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
                    name = 'lldb'
                }
                dap.configurations.cpp = {
                    {
                        name = 'Launch',
                        type = 'lldb',
                        request = 'launch',
                        program = function()
                            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                        end,
                        cwd = '${workspaceFolder}',
                        stopOnEntry = false,
                        args = {},

                        -- 💀
                        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
                        --
                        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                        --
                        -- Otherwise you might get the following error:
                        --
                        --    Error on launch: Failed to attach to the target process
                        --
                        -- But you should be aware of the implications:
                        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
                        -- runInTerminal = false,
                    },
                }

                -- If you want to use this for Rust and C, add something like this:

                dap.configurations.c = dap.configurations.cpp
                dap.configurations.rust = dap.configurations.cpp
            end },


            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- Terminal
    use {
        "akinsho/toggleterm.nvim", tag = 'v2.*',
        config = function()
            require("toggleterm").setup()
        end
    }

    -- Telescope (pickers)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    -- Nvim Tree (file navigation)
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly',
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    adaptive_size = true,
                    mappings = {
                        list = {
                            { key = "u", action = "dir_up" },
                        },
                    },
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    custom = { 
                        "^.git$",
                    },
                    dotfiles = false,
                },
            })
        end
    }

    -- Treesitter (syntax)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    }

    -- Error / Diagnostic Messages
    use {
        "folke/trouble.nvim",
        requires = {
            "folke/lsp-colors.nvim",
            "kyazdani42/nvim-web-devicons"
        },
        config = function()
            require("trouble").setup()
        end
    }

    -- Wildmenu
    use {
        'gelguy/wilder.nvim',
        config = function()
            local wilder = require('wilder')
            wilder.setup({modes = {':', '/', '?'}})
            wilder.set_option('renderer', wilder.popupmenu_renderer({
                highlighter = wilder.basic_highlighter(),
                left = {' ', wilder.popupmenu_devicons()},
                right = {' ', wilder.popupmenu_scrollbar()},
            }))
        end,
    }

    -- Tabline (buffers)
    use {
        'romgrk/barbar.nvim',
        requires = "kyazdani42/nvim-web-devicons"
    }

    -- Lualine status
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup{
                options = {
                    theme = 'tokyonight'
                },
                sections = {
                    lualine_c = {
                        'lsp_progress',
                    }
                }
            }
        end,
        requires = {
            'arkav/lualine-lsp-progress',
            'kyazdani42/nvim-web-devicons', opt = true
        }
    }

    -- Git
    use { 'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
        require('neogit').setup{}
    end
}

    -- Tpope plugins
    use {
        "tpope/vim-surround",
        "tpope/vim-repeat",
    }

    -- Automatically set up the configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end,
config = {
    display = {
        open_fn = function()
            -- Open in a floating window
            return require('packer.util').float({ border = 'single' })
        end
    }
}})
