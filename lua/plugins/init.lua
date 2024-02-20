local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { -- lsp configuration & plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            { 'j-hui/fidget.nvim',       tag = 'legacy' },
            -- 'opts = {}' is equivalent to 'require('neodev').setup({})'
            { 'folke/neodev.nvim',       opts = {} },
        },
        config = function()
            require("plugins.lsp")
        end
    },

    { -- completion engine
        'L3MON4D3/LuaSnip',
        config = function()
            require("plugins.luasnip")
        end
    },

    { -- completion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'rafamadriz/friendly-snippets',
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            -- 'nvim-treesitter/nvim-treesitter-context',
        },
        build = ':TSUpdate',
        config = function()
            require("plugins.treesitter")
        end
    },

    { -- fuzzy finder (files, lsp, etc.)
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        config = function()
            require("plugins.telescope")
        end
    },

    { -- statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("plugins.lualine")
        end
    },

    { -- commenting
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    {
        'lervag/vimtex',
        config = function()
            require("plugins.vimtex")
        end
    },

    -- { -- adds git related signs to the gutter, as well as utilities for managing changes
    --     'lewis6991/gitsigns.nvim',
    --     config = function()
    --         require("plugins.gitsigns")
    --     end
    -- },

    { -- add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup({
                indent = {
                    char = '╎',
                }
            })
            vim.cmd.highlight "IndentBlanklineChar guifg=#3c3836 gui=nocombine"
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },

    {
      'ellisonleao/gruvbox.nvim',
      priority = 1000,
      config = function()
        require("plugins.themes.gruvbox")
      end
    },

    -- {
    --     "miikanissi/modus-themes.nvim",
    --     priority = 1000,
    --     config = function()
    --         require("plugins.themes.modus")
    --     end
    -- },

    -- {
    --     "dracula/vim",
    --     priority = 1000,
    --     config = function()
    --         require("plugins.themes.dracula")
    --     end
    -- },

    -- {
    --   'projekt0n/github-nvim-theme',
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     require("plugins.themes.github")
    --   end
    -- },

    -- {
    --   "folke/tokyonight.nvim",
    --   priority = 1000,
    --   lazy = false,
    --   opts = {},
    --   config = function ()
    --     require("plugins.tokyonight")
    --   end
    -- },
})
