-- Be sure to explicitly define these LuaSnip node abbreviations!
local status, luasnip = pcall(require, "luasnip")
if not status then
  print("LuaSnip is not installed")
  return
end

local sn = luasnip.snippet_node
local i = luasnip.insert_node

local M = {}

M.line_begin = require("luasnip.extras.expand_conditions").line_begin

M.tex = {}
M.tex.in_mathzone = function () return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
M.tex.in_text = function() return not M.tex.in_mathzone() end
M.tex.in_tikz = function ()
  local is_inside = vim.fn['vimtex#env#is_inside']("tikzpicture")
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

-- Return text from visual selection buffer or empty insert_node
function M.get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

-- A logical OR of `line_begin` and the regTrig '[^%a]trig'
function M.line_begin_or_non_letter(line_to_cursor, matched_trigger)
  local line_begin = line_to_cursor:sub(1, -(#matched_trigger + 1)):match("^%s*$")
  local non_letter = line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match('[ :`=%{%(%["]')
  return line_begin or non_letter
end

return M

