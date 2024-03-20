local status, telescope = pcall(require, "telescope")
if not status then
	return
end

telescope.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
		-- fuzzy = true,
		-- override_generic_sorter = true,
		-- override_file_sorter = true,
		-- case_mode = "respect_case",
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
