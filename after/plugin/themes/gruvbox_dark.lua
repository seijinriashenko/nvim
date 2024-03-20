local status, gruvbox = pcall(require, "gruvbox")
if not status then
	print("gruvbox is not installed")
	return
end

gruvbox.setup({
	terminal_colors = true, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = false,
		emphasis = true,
		comments = true,
		operators = false,
		folds = false,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {
		-- dark0_hard = "#0b0c0c",
		-- dark0_hard = "#000000",
		-- dark0 = "#141414",
		-- dark0_soft = "#1e1d1c",
		-- dark1 = "#282624",
		-- dark2 = "#3a3532",
		-- dark3 = "#514942",
		dark0_hard = "#07080c",
		dark0 = "#0e1018",
		dark0_soft = "#131621",
		dark1 = "#191d2b",
		dark2 = "#202538",
		dark3 = "#272e44",
	},
	overrides = {
		SignColumn = { bg = "#0e1018" },
		-- MiniStatuLine
		MiniStatuslineModeNormal  = { bg = "#83a598", fg = "#07080c" },
		MiniStatuslineModeInsert  = { bg = "#b8bb26", fg = "#07080c"},
		MiniStatuslineModeVisual  = { bg = "#d3869b", fg = "#07080c"},
		MiniStatuslineModeReplace = { bg = "#fe8019", fg = "#07080c"},
		MiniStatuslineModeCommand = { bg = "#fabd2f", fg = "#07080c"},
		MiniStatuslineModeOther   = { bg = "#272e44", fg = "#1d2233"},
		MiniStatuslineDevinfo     = { bg = "#3b4466", fg = "#d5c4a1"},
		MiniStatuslineFilename    = { bg = "#1d2233", fg = "#a89984"},
		MiniStatuslineFileinfo    = { bg = "#1d2233", fg = "#a89984"},
		MiniStatuslineInactive    = { bg = "#1d2233", fg = "#a89984"},
	},
	dim_inactive = false,
	transparent_mode = false,
})

vim.cmd.colorscheme("gruvbox")
