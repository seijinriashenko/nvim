local status, luasnip = pcall(require, "luasnip")
if not status then
	return
end

local s = luasnip.snippet
local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local d = luasnip.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

luasnip.config.set_config({
	history = false, -- don't store snippet history or less overhead
	enable_autosnippets = true,
	store_selection_keys = "<Tab>", -- use <Tab> to trigger visual selection
	update_events = "TextChanged,TextChangedI",
})

-- require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
