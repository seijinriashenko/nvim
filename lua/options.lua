
vim.o.nu = true
vim.o.rnu = true

vim.o.signcolumn = "yes"
vim.o.colorcolumn = 80

vim.o.background = "dark"
vim.o.termguicolors = true

-- Maximum number of pop-up menu (PUM) items
vim.o.pumheight = 25

-- UX
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.smartindent = true
vim.o.wrap = false

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = "menuone,noselect"

vim.o.mouse = "a"

-- Misc
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.local/state/nvim/undodir"
