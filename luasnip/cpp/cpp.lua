local helpers = require("config.helpers")
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    -- main function
    s({trig = "main", snippetType = "autosnippet" },
        fmta(
            [[
            int main(int argc, char** argv) {
                <>
                return 0;
            }
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),
    -- generic function
    s({trig = "func", snippetType = "autosnippet" },
        fmta(
            [[
            // <>
            <>(<>) {
                <>
            }
            ]],
            {
                i(3),
                i(1),
                i(2),
                d(4, get_visual)
            }
        ),
        { condition = line_begin }
    ),
    -- block comment
    s({ trig = "/*", snippetType="autosnippet" },
      fmta(
          [[
          /*
              <>
          */
          ]],
          { i(1) }
      ),
      { condition = line_begin }
    ),
}
