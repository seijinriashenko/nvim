---@diagnostic disable: missing-fields
local status, nvim_ts_configs = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

nvim_ts_configs.setup({
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"html",
		"javascript",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
		"scss",
		"typescript",
		"vim",
		"vimdoc",
	},
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})
