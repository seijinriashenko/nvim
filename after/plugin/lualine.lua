local status, lualine = pcall(require, "lualine")
if not status then
	return
end

---@diagnostic disable-next-line: redefined-local
local status, custom_gruvbox = pcall(require, "lualine.themes.gruvbox_dark")
if not status then
	return
end

local colors = {
	-- black = "#1d2021",
	-- black        = '#0b0c0c',
	black = "#07080c",
	white = "#ebdbb2",
	red = "#fb4934",
	green = "#b8bb26",
	blue = "#83a598",
	yellow = "#fe8019",
	gray = "#a89984",
	-- darkgray = "#171919",
	-- lightgray = "#171919",
	-- inactivegray = "#171919",
	darkgray     = '#0e1018',
	lightgray    = '#0e1018',
	inactivegray = '#0e1018',
}

custom_gruvbox = {
	normal = {
		a = { bg = colors.gray, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.gray },
	},
	insert = {
		a = { bg = colors.blue, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.lightgray, fg = colors.white },
	},
	visual = {
		a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.inactivegray, fg = colors.gray },
	},
	replace = {
		a = { bg = colors.red, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.black, fg = colors.white },
	},
	command = {
		a = { bg = colors.green, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.inactivegray, fg = colors.gray },
	},
	inactive = {
		a = { bg = colors.darkgray, fg = colors.gray, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.gray },
		c = { bg = colors.darkgray, fg = colors.gray },
	},
}

lualine.setup({
	options = {
		icons_enabled = false,
		-- theme = custom_gruvbox,
		theme = "gruvbox_dark",
		component_separators = "|",
		section_separators = "",
	},
})
