local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta
local i = ls.insert_node

print("Loaded!")

return {
  s({ trig = "not", snippetType = "autosnippet" }, { t "\\lnot" }, { condition = math }),
  s({ trig = "or", snippetType = "autosnippet" }, { t "\\lor" }, { condition = math }),
  s({ trig = "exists", snippetType = "autosnippet" }, { t "\\exists" }, { condition = math }),
  s({ trig = "forall", snippetType = "autosnippet" }, { t "\\forall" }, { condition = math }),
  s({ trig = "and", snippetType = "autosnippet" }, { t "\\land" }, { condition = math }),
  s({ trig = "to", snippetType = "autosnippet" }, { t "\\to" }, { condition = math }),
  s({ trig = "equiv", snippetType = "autosnippet" }, { t "\\equiv" }, { condition = math }),
  s({ trig = "===", snippetType = "autosnippet" }, { t "\\equiv" }, { condition = math }),
  s(
    { trig = "exists", snippetType = "autosnippet" },
    fmta(
      [[
                \exists(<>}
            ]],
      { i(1) }
    ),
    { condition = math }
  ),
}
