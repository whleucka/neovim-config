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

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return packer.startup(function(use)
    -- My custom plugins

    -- Packer can manage itself
    use "wbthomason/packer.nvim"

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
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }


    -- Nvim Tree (file navigation)
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly',
        config = function()
            require("nvim-tree").setup()
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
                }
            }
        end,
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Tpope plugins
    use {
        "tpope/vim-surround",
        "tpope/vim-fugitive",
        "tpope/vim-repeat",
    }

    -- Automatically set up the configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
