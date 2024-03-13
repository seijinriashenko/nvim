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
	{ -- lsp configuration & plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			{ "j-hui/fidget.nvim", tag = "legacy" },
			-- 'opts = {}' is equivalent to 'require('neodev').setup({})'
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			require("plugins.lsp")
		end,
	},

	{ -- completion engine
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins.luasnip")
		end,
	},

	{ -- completion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"rafamadriz/friendly-snippets",
		},
	},

	{
		"ray-x/lsp_signature.nvim",
		-- event = "VeryLazy",
		config = function()
			require("plugins.lspsignature")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			-- 'nvim-treesitter/nvim-treesitter-context',
		},
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},

	{ -- fuzzy finder (files, lsp, etc.)
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		config = function()
			require("plugins.telescope")
		end,
	},

	{ -- statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugins.lualine")
		end,
	},

	{ -- commenting
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"lervag/vimtex",
		config = function()
			require("plugins.vimtex")
		end,
	},

	{
		"mfussenegger/nvim-dap",
		config = function()
			require("plugins.dap")
		end,
	},

	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("plugins.conform")
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			disable_in_macro = true, -- disable when recording or executing a macro
			disable_in_visualblock = false, -- disable when insert after visual block mode
			disable_in_replace_mode = true,
			ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
			enable_moveright = true,
			enable_afterquote = true, -- add bracket pairs after quote
			enable_check_bracket_line = true, --- check bracket in same line
			enable_bracket_in_quote = true, --
			enable_abbr = false, -- trigger abbreviation
			break_undo = true, -- switch for basic rule break undo sequence
			check_ts = false,
			map_cr = true,
			map_bs = true, -- map the <BS> key
			map_c_h = false, -- Map the <C-h> key to delete a pair
			map_c_w = false, -- map <c-w> to delete a pair if possible
		},
	},

	-- { -- adds git related signs to the gutter, as well as utilities for managing changes
	--     'lewis6991/gitsigns.nvim',
	--     config = function()
	--         require("plugins.gitsigns")
	--     end
	-- },

	{ -- add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({
				indent = {
					char = "╎",
				},
			})
			vim.cmd.highlight("IndentBlanklineChar guifg=#3c3836 gui=nocombine")
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("plugins.themes.gruvbox")
		end,
	},

	-- {
	--     "miikanissi/modus-themes.nvim",
	--     priority = 1000,
	--     config = function()
	--         require("plugins.themes.modus")
	--     end
	-- },

	-- {
	-- 	"gbprod/nord.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("plugins.themes.nord")
	-- 	end,
	-- },
})
