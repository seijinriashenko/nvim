local status, lualine = pcall(require, "lualine")
if not status then
  print("lualine is not installed")
  return
end

lualine.setup {
  options = {
    icons_enabled = false,
    theme = 'modus-vivendi',
    component_separators = '|',
    section_separators = '',
  },
}
