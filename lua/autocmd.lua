-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Remove any trailing whitespace on file savesvim.api.nvim_create_autocmd(
vim.cmd([[
  autocmd BufWritePre *.lua :%s/\s\+$//e
]])
