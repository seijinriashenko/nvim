local mason = pcall(require, "mason")
if not mason then
  return
end

mason.setup = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

local mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig then
  return
end

mason_lspconfig.setup = {
    ensure_installed = {
      "bashls",
      "clangd",
      "cssls",
      "gopls",
      "html",
      "jsonls",
      "tsserver",
      "texlab",
      "lua_ls",
      "pyright",
      "rust_analyzer"
    },

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    automatic_installation = false,

    -- See `:h mason-lspconfig.setup_handlers()`
    handlers = nil,
}
