-- safe imports
local status, lspconfig = pcall(require, "lspconfig")
if not status then
    print("lspconfig is not installed")
    return
end

local status, cmp = pcall(require, "cmp")
if not status then
    print("nvim-cmp is not installed")
    return
end

local status, cmp_capabilities = pcall(require, "cmp_nvim_lsp")
if not status then
    print("cmp_nvim_lsp is not installed")
    return
end

local status, luasnip = pcall(require, "luasnip")
if not status then
    print("luasnip is not installed")
    return
end

-- Diagnostics setup
vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    underline = true,
})

-- Language servers setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_capabilities.default_capabilities(capabilities)


local servers = { "clangd", "cssls", "html", "pyright", "rust_analyzer", "texlab", "tsserver" }

vim.g.rust_recommended_style = false

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

lspconfig["lua_ls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim", "on_attach", "awesome" } },
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
        },
    },
})

-- Completion setup

local kind_icons = {
    Text = "",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
}


cmp.setup {
---@diagnostic disable-next-line: missing-fields
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local lspkind_ok, lspkind = pcall(require, "lspkind")
            if not lspkind_ok then
                -- From kind_icons array
                vim_item.kind = string.format('%s ', kind_icons[vim_item.kind]) -- This concatenates the icons with the name of the item kind
                -- Source
                vim_item.menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                    latex_symbols = "[LaTeX]",
                })[entry.source.name]
                return vim_item
            else
                -- From lspkind
                return lspkind.cmp_format()(entry, vim_item)
            end
        end
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete {},
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
    },
    sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "nvim_lsp_signature_help" },
    },
    window = {
        completion = {
            side_padding = 1,
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
            zindex = 1001,
            border = "rounded",
        },
        documentation = {
            side_padding = 1,
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
            zindex = 1001,
            border = "rounded",
        },
    },
}
