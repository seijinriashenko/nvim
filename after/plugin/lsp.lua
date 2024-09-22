local status, lspconfig = pcall(require, "lspconfig")
if not status then
	print("lspconfig is not installed")
	return
end

-- Enable the following language servers
local servers = {
	clangd = {},
	cssls = {},
	html = {},
	pyright = {},
	texlab = {},
	tsserver = {},
	lua_ls = {
		-- cmd = {...},
		-- filetypes { ...},
		-- capabilities = {},
		settings = {
			Lua = {
				completion = { callSnippet = "Replace" },
				diagnostics = { globals = { "vim", "awesome" } },
				telemetry = { enable = false },
				workspace = { checkThirdParty = false },
			},
		},
	},
}

local capabilities = vim.tbl_deep_extend(
	"force",
	vim.lsp.protocol.make_client_capabilities(),
	require("cmp_nvim_lsp").default_capabilities()
)

-- Diagnostics setup
vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	underline = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		-- Highlight references of the word under your cursor
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

---@diagnostic disable-next-line: redefined-local
local status, mason = pcall(require, "mason")
if not status then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

---@diagnostic disable-next-line: redefined-local
local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
	return
end

mason_lspconfig.setup({
	ensure_installed = { "bashls", "clangd", "cssls", "html", "ts_ls", "texlab", "lua_ls", "pyright" },
	-- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
	automatic_installation = false,
	-- See `:h mason-lspconfig.setup_handlers()`
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			-- This handles overriding only values explicitly passed
			-- by the server configuration above. Useful when disabling
			-- certain features of an LSP (for example, turning off formatting for tsserver)
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			lspconfig[server_name].setup(server)
		end,
	},
})

-- Completion setup
---@diagnostic disable-next-line: redefined-local
local status, cmp = pcall(require, "cmp")
if not status then
	return
end

---@diagnostic disable-next-line: redefined-local
local status, luasnip = pcall(require, "luasnip")
if not status then
	return
end

luasnip.config.setup({})


cmp.setup({
	view = {
		entries = { name = "custom", selection_order = "near_cursor" },
	},
---@diagnostic disable-next-line: missing-fields
	formatting = {
		format = function(entry, vim_item)
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = { completeopt = "menu,menuone,noinsert" },
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		-- Manually trigger a completion from nvim-cmp.
		["<C-Space>"] = cmp.mapping.complete({}),
		-- <c-l> will move you to the right of each of the expansion locations.
		["<C-l>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),
		-- <c-h> is similar, except moving you backwards.
		["<C-h>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "nvim_lsp_signature_help" },
	},
	-- Disable compleiton in comments
	enabled = function()
		local context = require("cmp.config.context")
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
})
