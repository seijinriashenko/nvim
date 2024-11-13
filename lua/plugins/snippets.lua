return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local ls = require("luasnip")
			local s = ls.snippet
			local sn = ls.snippet_node
			local isn = ls.indent_snippet_node
			local t = ls.text_node
			local i = ls.insert_node
			local f = ls.function_node
			local c = ls.choice_node
			local d = ls.dynamic_node
			local r = ls.restore_node
			local events = require("luasnip.util.events")
			local ai = require("luasnip.nodes.absolute_indexer")
			local fmt = require("luasnip.extras.fmt").fmt
			local fmta = require("luasnip.extras.fmt").fmta
			local m = require("luasnip.extras").m
			local lambda = require("luasnip.extras").l
			local postfix = require("luasnip.extras.postfix").postfix

			ls.config.set_config({
				enable_autosnippets = true,
				update_events = "TextChanged,TextChangedI",
				store_selection_keys = "<Tab>",
			})

			require("luasnip.loaders.from_lua").load({
				paths = {
					"~/.config/nvim/luasnip",
				},
			})
		end,
	},
}
