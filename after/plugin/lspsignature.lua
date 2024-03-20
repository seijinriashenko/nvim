local status, lsp_signature = pcall(require, "lsp_signature")
if not status then
	return
end

lsp_signature.setup({
	hint_prefix = "",
	bind = true,
	max_height = 12, -- max height of signature floating_window
	max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
	-- the value need >= 40
	wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
	floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
	floating_window_above_cur_line = false,
})
