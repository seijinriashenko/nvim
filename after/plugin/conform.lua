local status, conform = pcall(require, "conform")
if not status then
	return
end

conform.setup({
	notify_on_error = false,
	-- format_on_save = {
	-- 	timeout_ms = 500,
	-- 	lsp_fallback = true,
	-- },
	formatters = {
		clang_format = {
			prepend_args = {
				"--style",
				"{BasedOnStyle: llvm, IndentWidth: 4, PointerAlignment: Left, BreakBeforeBinaryOperators: true}",
			},
		},
	},
	formatters_by_ft = {
		c = { "clang_format" },
		cc = { "clang_format" },
		cpp = { "clang_format" },
		h = { "clang_format" },
		hh = { "clang_format" },
		hpp = { "clang_format" },
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
	},
})
