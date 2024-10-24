local opts = { silent = true, noremap = true }

-- Remove highlighting from the searched text
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open netrw
-- vim.keymap.set("n", "<leader>ee", vim.cmd.Explore)

-- Easier navigation for wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Move selected text easily
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy/paste goodies
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Window Movement
opts.desc = "Move focus to the left window"
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", opts)

opts.desc = "Move focus to the right window"
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", opts)

opts.desc = "Move focus to the lower window"
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", opts)

opts.desc = "Move focus to the upper window"
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", opts)

opts.desc = "Move focus to the left window"
vim.keymap.set("n", "<C-Left>", "<C-w><C-h>", opts)

opts.desc = "Move focus to the right window"
vim.keymap.set("n", "<C-Right>", "<C-w><C-l>", opts)

opts.desc = "Move focus to the lower window"
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>", opts)

opts.desc = "Move focus to the upper window"
vim.keymap.set("n", "<C-Up>", "<C-w><C-k>", opts)


-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range (in visual mode)" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })


-- LuaSnip
-- vim.cmd([[
--   " Expand
--   " imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'
--   imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
--
--   " Jump forward
--   " imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
--   " smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
--   smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
--
--   " Jump backward
--   imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-j>'
--   smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-j>'
--
--   " Cycle forward through choice nodes with Control-F
--   " imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
--   " smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
-- ]])

-- vim.keymap.set(
-- 	"",
-- 	"<Leader>U",
-- 	'<Cmd>lua require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/lua/snippets/"})<CR><Cmd>echo "Snippets refreshed!"<CR>',
-- 	{ desc = "[U]pdate snippets" }
-- )
--
-- -- Telescope
-- -- See `:help telescope.builtin`
-- local builtin = require("telescope.builtin")
--
-- vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
-- vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
-- vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
-- vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
-- vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
-- vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
-- vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
-- vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
-- vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
-- vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
--
-- -- Slightly advanced example of overriding default behavior and theme
-- vim.keymap.set("n", "<leader>/", function()
-- 	-- You can pass additional configuration to telescope to change theme, layout, etc.
-- 	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
-- 		winblend = 10,
-- 		previewer = false,
-- 	}))
-- end, { desc = "[/] Fuzzily search in current buffer" })
--
-- -- Also possible to pass additional configuration options.
-- --  See `:help telescope.builtin.live_grep()` for information about particular keys
-- vim.keymap.set("n", "<leader>s/", function()
-- 	builtin.live_grep({
-- 		grep_open_files = true,
-- 		prompt_title = "Live Grep in Open Files",
-- 	})
-- end, { desc = "[S]earch [/] in Open Files" })
--
-- -- Shortcut for searching your neovim configuration files
-- vim.keymap.set("n", "<leader>sn", function()
-- 	builtin.find_files({ cwd = vim.fn.stdpath("config") })
-- end, { desc = "[S]earch [N]eovim files" })
--
-- -- nvim-dap (DAP - Debug Adapter Protocol)
-- local dap = require("dap")
-- vim.keymap.set("n", "<F5>", function() dap.continue() end, opts)
-- vim.keymap.set("n", "<F9>", function() dap.toggle_breakpoint() end)
-- vim.keymap.set("n", "<F10>", function() dap.step_over() end, opts)
-- vim.keymap.set("n", "<F11>", function() dap.step_into() end, opts)
-- vim.keymap.set("n", "<F12>", function() dap.step_out() end, opts)
-- vim.keymap.set("n", "<Leader><F9>", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
-- vim.keymap.set("n", "<Leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
-- vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end)
-- vim.keymap.set("n", "<Leader>dl", function() dap.run_last() end)
