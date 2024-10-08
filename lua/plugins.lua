return {
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	"L3MON4D3/LuaSnip",
	"stevearc/conform.nvim",
	"lewis6991/gitsigns.nvim",
	"nvim-treesitter/nvim-treesitter",
	"farmergreg/vim-lastplace",
	-- "lervag/vimtex",

	{ "numToStr/Comment.nvim", opts = {} },
	{ "norcalli/nvim-colorizer.lua", opts = {} },
	{ "folke/which-key.nvim", event = "VimEnter" },

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"ray-x/lsp_signature.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"rafamadriz/friendly-snippets",
		},
	},

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for install instructions
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
	},

	{
		"echasnovski/mini.nvim",
		dependencies = {
			-- Statusline
			{ "lewis6991/gitsigns.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	priority = 1000,
	-- },

	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- },
	--
	-- {
	-- 	"craftzdog/solarized-osaka.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- },

	{
		"miikanissi/modus-themes.nvim",
		priority = 1000,
		opts = {},
	},

	-- { "rose-pine/neovim", name = "rose-pine", priority = 1000 }
}
