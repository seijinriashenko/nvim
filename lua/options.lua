--------------------
-- Global options --
--------------------
--  NOTE: Must happen before plugins are loaded
--	  (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true -- true if a nerd font is installed

---------------------
----- Languages -----
---------------------
local langmap_keys = {
	-- Russian
	'ёЁ;`~', '№;#',
	'йЙ;qQ', 'цЦ;wW', 'уУ;eE', 'кК;rR', 'еЕ;tT', 'нН;yY', 'гГ;uU', 'шШ;iI', 'щЩ;oO', 'зЗ;pP', 'хХ;[{', 'ъЪ;]}',
	'фФ;aA', 'ыЫ;sS', 'вВ;dD', 'аА;fF', 'пП;gG', 'рР;hH', 'оО;jJ', 'лЛ;kK', 'дД;lL', [[жЖ;\;:]], [[эЭ;'\"]],
	'яЯ;zZ', 'чЧ;xX', 'сС;cC', 'мМ;vV', 'иИ;bB', 'тТ;nN', 'ьЬ;mM', [[бБ;\,<]], 'юЮ;.>',
	-- Ukrainian
	[[\ʼ;~]],    '№;#',
	'йЙ;qQ',     'цЦ;wW', 'уУ;eE',  'кК;rR', 'еЕ;tT', 'нН;yY', 'гГ;uU', 'шШ;iI',    'щЩ;oO',    'зЗ;pP',    'хХ;[{', 'їЇ;]}', [[ґҐ;\\|]],
	'фФ;aA',     'іІ;sS', 'вВ;dD',  'аА;fF', 'пП;gG', 'рР;hH', 'оО;jJ', 'лЛ;kK',    'дД;lL', [[жЖ;\;:]], [[єЄ;'\"]],
	'яЯ;zZ',     'чЧ;xX', 'сС;cC',  'мМ;vV', 'иИ;bB', 'тТ;nN', 'ьЬ;mM', [[бБ;\,<]], 'юЮ;.>',
}
vim.opt.langmap = table.concat(langmap_keys, ',')

--------------------
------- UI ---------
--------------------
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.list = false
vim.opt.listchars = "tab:» ,trail:·,nbsp:␣"

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"

vim.opt.background = "dark"
vim.opt.termguicolors = true

-- PUM = Pop-Up Menu
-- vim.opt.pumblend  = 10
vim.opt.pumheight = 20

vim.opt.showmode = false
vim.opt.cursorline = false
-- View what you substitute with :s
vim.opt.inccommand = "split"

--------------------
------- UX ---------
--------------------
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- vim.opt.completeopt = "menuone,noselect"

vim.opt.mouse = "a"

-- Misc
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undodir"
