-- Global configuration of VimTex's settings

-- Turn off VimTex indentation
vim.g.vimtex_indent_enabled = 0

-- Disable default mapping; i'll define my own
vim.g.vimtex_mappings_enabled = 0

-- Disable insert mode mappings (in favor of LuaSnip)
vim.g.vimtex_imaps_enabled = 0

-- Define what syntax should be concealed
vim.g.vimtex_syntax_conceal = {
	accents = 1,
	ligatures = 1,
	cites = 1,
	fancy = 1,
	spacing = 1,
	greek = 1,
	math_bounds = 1,
	math_delimiters = 1,
	math_fracs = 1,
	math_super_sub = 1,
	math_symbols = 1,
	sections = 1,
	styles = 1,
}

-- Make this option twice as small to prevent lags
vim.g.vimtex_delim_stopline = 250

-- Delimeter configuration
vim.g.vimtex_delim_toggle_mod_list = {
	{ "\\left", "\\right" },
	{ "\\big", "\\big" },
}

vim.g.vimtex_compiler_latexmk_engines = {
	["_"] = "-xelatex",
	["pdfdvi"] = "-pdfdvi",
	["pdfps"] = "-pdfps",
	["pdflatex"] = "-pdf",
	["luatex"] = "-lualatex",
	["lualatex"] = "-lualatex",
	["xelatex"] = "-xelatex",
	["context (pdftex)"] = "-pdf -pdflatex=texexec",
	["context (luatex)"] = "-pdf -pdflatex=context",
	["context (xetex)"] = "-pdf -pdflatex='texexec --xtx'",
}

vim.g.vimtex_compiler_latexmk = {
	aux_dir = "",
	out_dir = "",
	callback = 1,
	continuous = 1,
	executable = "latexmk",
	hooks = {},
	options = {
		"-xelatex",
		"-verbose",
		"-file-line-error",
		"-synctex=1",
		"-interaction=nonstopmode",
	},
}

-- Filter out some compilation warning messages from QuickFix display
vim.g.vimtex_quickfix_ignore_filters = {
	"Underfull \\hbox",
	"Overfull \\hbox",
	"LaTeX Warning: .\\+ float specifier changed to",
	"LaTeX hooks Warning",
	'Package siunitx Warning: Detected the "physics" package:',
	"Package hyperref Warning: Token not allowed in a PDF string",
}

-- Use Zathura as the VimTeX PDF viewer
vim.g.vimtex_view_method = "zathura"

-- Don't open QuickFix for warning messages if no errors are present
vim.g.vimtex_quickfix_open_on_warning = 0
