return {
    -- Theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("whleucka.config.tokyonight")
        end,
        init = function()
            vim.opt.termguicolors = true
            vim.cmd [[colorscheme tokyonight]]
        end
    },

    -- Error / Diagnostic Messages
    {
        "folke/trouble.nvim",
        event = "CursorHold",
        dependencies = {
            "folke/lsp-colors.nvim",
            "kyazdani42/nvim-web-devicons"
        },
        config = function()
            require("trouble").setup()
        end
    },

    -- Which key
    {
        "folke/which-key.nvim",
        event = "CursorHold",
        config = function()
            require("whleucka.config.whichkey")
        end
    },

    {
        "kwkarlwang/bufresize.nvim",
        event = "CursorHold",
        config = function()
            require("bufresize").setup()
        end
    },


    -- Tpope
    { "tpope/vim-surround",
        event = "CursorHold",
    },
    { 'tpope/vim-commentary',
        event = "CursorHold",
    },

    -- Telescope (pickers)
    {
        'nvim-telescope/telescope.nvim', version = '0.1.0',
        event = "CursorHold",
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            },
        },
        config = function()
            require("whleucka.config.telescope")
        end
    },

    -- Nvim Tree (file navigation)
    {
        'kyazdani42/nvim-tree.lua',
        event = "CursorHold",
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        version = 'nightly',
        config = function()
            require("whleucka.config.nvim-tree")
        end
    },

    -- Treesitter (syntax)
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring'
        },
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        config = function()
            require("whleucka.config.treesitter")
        end
    },

    -- Barbar (buffers)
    {
        event = "BufReadPre",
        'romgrk/barbar.nvim',
        dependencies = "kyazdani42/nvim-web-devicons"
    },

    -- Lualine status
    {
        event = "CursorHold",
        'nvim-lualine/lualine.nvim',
        config = function()
            require("whleucka.config.lualine")
        end,
        dependencies = {
            'arkav/lualine-lsp-progress',
            'kyazdani42/nvim-web-devicons',
        }
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        event = "CursorHold",
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'nvim-lua/lsp_extensions.nvim' },
            { 'ray-x/lsp_signature.nvim',
            config = function()
                require("lsp_signature").setup {}
            end },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

            -- VScode-like pictograms
            { 'onsails/lspkind.nvim' }
        }
    },

    -- DAP
    {
        "mfussenegger/nvim-dap",
        opt = true,
        event = "CursorHold",
        module = { "dap" },
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "nvim-telescope/telescope-dap.nvim",
            "mfussenegger/nvim-dap-python",
            { "leoluz/nvim-dap-go", module = "dap-go" },
            { "jbyuki/one-small-step-for-vimkind", module = "osv" },
        },
        config = function()
            require("whleucka.core.dap").setup()
        end,
    },

    -- Testing
    {
        "nvim-neotest/neotest",
        event = "BufReadPre",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "olimorris/neotest-phpunit",
            "nvim-neotest/neotest-python",
        },
        config = function()
            require("whleucka.config.neotest")
        end
    },

    -- Git signs
    {
        'lewis6991/gitsigns.nvim',
        event = "BufReadPre",
        config = function()
            require('gitsigns').setup()
        end
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim", version = 'v2.*',
        event = "CursorHold",
        config = function()
            require("toggleterm").setup()
        end
    },

    -- Fancy notifications
    {
        "rcarriga/nvim-notify",
        event = "CursorHold",
        config = function()
            require("whleucka.config.notify")
        end
    },

    -- Wildmenu
    {
        'gelguy/wilder.nvim',
        event = "CursorHold",
        config = function()
            require("whleucka.config.wilder")
        end,
    },

    -- Neogit & Diffs
    {
        'TimUntersberger/neogit',
        event = "CursorHold",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
        },
        config = function()
            require("whleucka.config.neogit")
        end
    },

    -- Colours
    {
        'norcalli/nvim-colorizer.lua',
        event = "CursorHold",
        config = function()
            require('colorizer').setup()
        end
    },

    -- My plugins
    -- {
    --     'whleucka/soprano.nvim',
    --     dependencies = {
    --         "akinsho/toggleterm.nvim"
    --     }
    -- },
}
