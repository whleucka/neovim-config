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


return packer.startup({ function(use)
    -- My custom plugins

    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Dressing
    use {
        "stevearc/dressing.nvim",
        config = function()
            require("whleucka.config.dressing")
        end,
    }

    -- Improve startup time
    use "lewis6991/impatient.nvim"

    -- Theme
    use {
        "folke/tokyonight.nvim",
        config = function()
            require("whleucka.config.tokyonight")
        end,
    }

    -- Git signs
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
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
    }

    -- Terminal
    use {
        "akinsho/toggleterm.nvim", tag = 'v2.*',
        config = function()
            require("toggleterm").setup()
        end
    }

    -- Mini stuff (enable different modules)
    use {
        'echasnovski/mini.nvim',
        config = function()
            require("whleucka.config.mini")
        end
    }

    -- Telescope (pickers)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make'
            },
        },
        config = function()
            require("whleucka.config.telescope")
        end
    }

    -- Nvim Tree (file navigation)
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly',
        config = function()
            require("whleucka.config.tree")
        end
    }

    -- Treesitter (syntax)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        config = function()
            require("whleucka.config.treesitter")
        end
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

    -- Which key
    use {
        "folke/which-key.nvim",
        config = function()
            require("whleucka.config.whichkey")
        end
    }

    -- Noice!
    --use({
    --    "folke/noice.nvim",
    --    config = function()
    --        require("whleucka.config.noice")
    --    end,
    --    requires = {
    --        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --        "MunifTanjim/nui.nvim",
    --        -- OPTIONAL:
    --        --   `nvim-notify` is only needed, if you want to use the notification view.
    --        --   If not available, we use `mini` as the fallback
    --        {
    --            "rcarriga/nvim-notify",
    --            config = function()
    --                require("whleucka.config.notify")
    --            end
    --        },
    --    }
    --})

    -- Fancy notifications
    use {
        "rcarriga/nvim-notify",
        config = function()
            require("whleucka.config.notify")
        end
    }

    -- Wildmenu
    use {
        'gelguy/wilder.nvim',
        config = function()
            require("whleucka.config.wilder")
        end,
    }

    -- Barbar (buffers)
    use {
        'romgrk/barbar.nvim',
        requires = "kyazdani42/nvim-web-devicons"
    }

    -- Lualine status
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("whleucka.config.lualine")
        end,
        requires = {
            'arkav/lualine-lsp-progress',
            'kyazdani42/nvim-web-devicons', opt = true
        }
    }

    -- GPS status line (symbol breadcrumbs)
    use {
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-gps").setup {}
        end
    }

    -- Neogit & Diffs
    use { 'TimUntersberger/neogit',
        requires = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
        },
        config = function()
            require("whleucka.config.neogit")
        end
    }

    -- Tpope plugins
    use {
        "tpope/vim-surround",
        "tpope/vim-repeat",
    }

    -- Profile
    use { 'dstein64/vim-startuptime' }

    -- My plugins
    use { 'whleucka/soprano.nvim',
        requires = {
            "akinsho/toggleterm.nvim"
        }
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
    } })
