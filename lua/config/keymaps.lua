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
