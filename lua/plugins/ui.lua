return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = {
				char = "┃",
				tab_char = "┃",
			},
			scope = { show_start = false, show_end = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			local lazy_status = require("lazy.status")

			lualine.setup({
				options = {
					icons_enabled = false,
					theme = "gruvbox",
					component_separators = "",
					section_separators = "",
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 100,
						tabline = 100,
						winbar = 100,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = {
						{ -- check if there're any plugin updates
							lazy_status.updates,
							cond = lazy_status.has_updates,
							color = { fg = "#f9d8b6" },
						},
						{ "encoding" },
						{ "fileformat" },
						{ "filetype" },
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local bufferline = require("bufferline")

			bufferline.setup({
				options = {
					mode = "buffers", -- set to "tabs" to only show tabpages instead
					style_preset = bufferline.style_preset.no_italic, -- or bufferline.style_preset.minimal,
					themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
					numbers = "none",
					close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
					right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
					left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
					middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
					indicator = {
						icon = "▎", -- this should be omitted if indicator style is not 'icon'
						style = "icon",
					},
					buffer_close_icon = "󰅖",
					modified_icon = "● ",
					close_icon = " ",
					left_trunc_marker = " ",
					right_trunc_marker = " ",
					max_name_length = 18,
					max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
					truncate_names = true, -- whether or not tab names should be truncated
					tab_size = 18,
					diagnostics = "nvim_lsp",
					diagnostics_update_in_insert = false, -- only applies to coc
					diagnostics_update_on_event = true, -- use nvim's diagnostic handler
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
							separator = true,
						},
					},
					color_icons = true, -- whether or not to add the filetype icon highlights
					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},
				},
			})

            local map = function(keys, func, desc, mode)
                mode = mode or "n"
                vim.keymap.set(mode, keys, func, { silent = true, desc = "Bufferline: " .. desc }) end

            map("<leader>1", ":BufferLineGoToBuffer 1<CR>", "Goto buffer [1]")
            map("<leader>2", ":BufferLineGoToBuffer 2<CR>", "Goto buffer [2]")
            map("<leader>3", ":BufferLineGoToBuffer 3<CR>", "Goto buffer [3]")
            map("<leader>4", ":BufferLineGoToBuffer 4<CR>", "Goto buffer [4]")
            map("<leader>5", ":BufferLineGoToBuffer 5<CR>", "Goto buffer [5]")
            map("<leader>6", ":BufferLineGoToBuffer 6<CR>", "Goto buffer [6]")
            map("<leader>7", ":BufferLineGoToBuffer 7<CR>", "Goto buffer [7]")
            map("<Tab>", ":BufferLineCycleNext<CR>", "Next buffer")
            map("<S-Tab>", ":BufferLineCyclePrev<CR>", "Previous buffer")
		end,
	},
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{ "j-hui/fidget.nvim", opts = {} },
}
