local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Theme
    {
        "folke/tokyonight.nvim",
        config = function()
            require("whleucka.config.tokyonight")
        end,
    },

    -- Git signs
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
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

    -- Terminal
    {
        "akinsho/toggleterm.nvim", version = 'v2.*',
        config = function()
            require("toggleterm").setup()
        end
    },

    -- Telescope (pickers)
    {
        'nvim-telescope/telescope.nvim', version = '0.1.0',
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
        dependencies = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        version = 'nightly',
        config = function()
            require("whleucka.config.nvim-tree")
        end
    },

    -- Treesitter (syntax)
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        config = function()
            require("whleucka.config.treesitter")
        end
    },

    -- Error / Diagnostic Messages
    {
        "folke/trouble.nvim",
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
        config = function()
            require("whleucka.config.whichkey")
        end
    },

    -- Fancy notifications
    {
        "rcarriga/nvim-notify",
        config = function()
            require("whleucka.config.notify")
        end
    },

    -- Wildmenu
    {
        'gelguy/wilder.nvim',
        config = function()
            require("whleucka.config.wilder")
        end,
    },

    -- Barbar (buffers)
    {
        'romgrk/barbar.nvim',
        dependencies = "kyazdani42/nvim-web-devicons"
    },

    -- Lualine status
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("whleucka.config.lualine")
        end,
        dependencies = {
            'arkav/lualine-lsp-progress',
            'kyazdani42/nvim-web-devicons',
        }
    },

    -- Neogit & Diffs
    { 'TimUntersberger/neogit',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
    },
    config = function()
        require("whleucka.config.neogit")
    end
},

-- Profile
{ 'dstein64/vim-startuptime' },

-- Colours
{ 'norcalli/nvim-colorizer.lua',
config = function()
    require('colorizer').setup()
end
    },

    -- Tpope
    { 'tpope/vim-surround' },
    { 'tpope/vim-commentary' },

    -- My plugins
    { 'whleucka/soprano.nvim',
    dependencies = {
        "akinsho/toggleterm.nvim"
    },
}
})
