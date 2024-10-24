return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"bashls",
					"clangd",
					"cmake",
					"cssls",
					"html",
					"texlab",
					"lua_ls",
					"glsl_analyzer",
					"pyright",
					"rust_analyzer",
					"sqls",
					"ts_ls",
					"zls",
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"bibtex-tidy",
					"black",
					"clang-format",
					"cmakelang",
					"isort",
					"prettier",
					"stylua",
					"stylua",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependecies = {
			"hrsh7th/cmp-nvim-lsp",
			"folke/lazydev.nvim",
			"j-hui/fidget.nvim",
            "ray-x/lsp_signature.nvim",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(e)
					local telescope_builtin = require("telescope.builtin")
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = e.buf, silent = true, desc = "LSP: " .. desc })
					end

					map("gd", telescope_builtin.lsp_definitions, "[G]oto [D]efinition")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("gr", telescope_builtin.lsp_references, "[G]oto [R]eferences")
					map("gi", telescope_builtin.lsp_implementations, "[G]oto [I]mplementation")
					map("gt", telescope_builtin.lsp_type_definitions, "[G]oto [T]ype Definitions")
					-- map("<leader>ds", telescope_builtin.lsp_document_symbols, "Search [D]ocument [S]ymbols")
					-- map("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, "Search [W]orkspace [S]ymbols")
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame current symbol")
					map("<leader>ca", vim.lsp.buf.code_action, "Show available [C]ode [A]ctions")
					map("K", vim.lsp.buf.hover, "Show hover documentation")
                    map("<leader>k", vim.lsp.buf.signature_help, "Toggle signature")

					map("<leader>sd", telescope_builtin.diagnostics, "[S]earch [D]iagnostics in current buffer")
					map("<leader>od", vim.diagnostic.open_float, "[O]pen [D]iagnostic for current line")
					map("[d", vim.diagnostic.goto_prev, "Goto previous [d]iagnostic")
					map("]d", vim.diagnostic.goto_next, "Goto next [d]iagnostic")

					map("<leader>rs", ":LspRestart<CR>", "[R]e[s]tart LSP")

					-- Highligh references for a symbol under the cursor
					local client = vim.lsp.get_client_by_id(e.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup("UserLspHighlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = e.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = e.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("UserLspDetach", { clear = true }),
							callback = function(ev)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "UserLspHighlight", buffer = ev.buf })
							end,
						})
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

			local servers = {
				clangd = {},
                cssls = {},
                html = {},
				pyright = {},
				rust_analyzer = {},
                texlab = {},
				ts_ls = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS"s noisy `missing-fields` warnings
							diagnostics = {
								globals = { "vim" },
								disable = { "missing-fields" },
							},
						},
					},
				},
			}

			mason_lspconfig.setup_handlers({
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					lspconfig[server_name].setup(server)
				end,
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		cmd = "LazyDev",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				{ path = "LazyVim", words = { "LazyVim" } },
				{ path = "lazy.nvim", words = { "LazyVim" } },
			},
		},
	},
	-- Manage libuv types with lazy. Plugin will never be loaded
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				notify_on_error = false,
				formatters = {
					clang_format = {
						prepend_args = {
							"--style",
							"{ \
                                 BasedOnStyle: llvm, \
                                 IndentWidth: 4, \
                                 PointerAlignment: Left, \
                                 BreakBeforeBinaryOperators: true, \
                                 ColumnLimit: 100, \
                                 IncludeCategories: [{Regex: '^#', Priority: 0}] \
                                 AllowShortFunctionsOnASingleLine: Empty \
                            }",
						},
					},
				},
				formatters_by_ft = {
					-- Writing
					bib = { "bibtex-tidy" },
					markdown = { "prettier" },
					-- Low-level stuff
					c = { "clang_format" },
					cc = { "clang_format" },
					cpp = { "clang_format" },
					h = { "clang_format" },
					hh = { "clang_format" },
					hpp = { "clang_format" },
					cmake = { "cmakelang" },
					-- Webdev
					css = { "prettier" },
					html = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					-- Misc
					python = { "isort", "black" },
					rust = { "rustfmt" },
					zig = { "zigfmt" },
					lua = { "stylua" },
					json = { "prettier" },
					yaml = { "prettier" },
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>fm", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "[F]or[m]at file or range (in visual mode)" })
		end,
	},
}
