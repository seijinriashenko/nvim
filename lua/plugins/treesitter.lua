local status, nvim_treesiter_configs = pcall(require, "nvim-treesitter.configs")
if not status then
  print("nvim-treesitter is not installed")
  return
end

---@diagnostic disable-next-line: missing-fields
nvim_treesiter_configs.setup({
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'css',
    'html',
    'javascript',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'rust',
    'scss',
    'typescript',
    'vim',
    'vimdoc',
  },

  auto_install = false,

  highlight = { enable = true },

  indent = { enable = true },
})
