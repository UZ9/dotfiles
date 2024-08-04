local ls = require "luasnip"
local s = ls.snippet

local function math()
  return vim.api.nvim_eval "vimtex#syntax#in_mathzone()" == 1
end

-- dynamic matrix
local mat = function(args, snip)
  local rows = tonumber(snip.captures[2])
  local cols = tonumber(snip.captures[3])
  local nodes = {}
  local ins_indx = 1
  for j = 1, rows do
    table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
    ins_indx = ins_indx + 1
    for k = 2, cols do
      table.insert(nodes, t " & ")
      table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
      ins_indx = ins_indx + 1
    end
    table.insert(nodes, t { "\\\\", "" })
  end
  return sn(nil, nodes)
end

return {
  s(
    { trig = "([bBpvV])mat(%d+)x(%d+)([ar])", regTrig = true, name = "matrix", dscr = "matrix trigger lets go" },
    fmt(
      [[
        \begin{<>}<>
        <>
        \end{<>}]],
      {
        f(function(_, snip)
          return snip.captures[0] .. "matrix"
        end),
        f(function(_, snip) -- augments
          if snip.captures[3] == "a" then
            out = string.rep("c", tonumber(snip.captures[2]) - 1)
            return "[" .. out .. "|c]"
          end
          return ""
        end),
        d(0, mat),
        f(function(_, snip)
          return snip.captures[0] .. "matrix"
        end),
      },
      { delimiters = "<>" }
    )
  ),
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
  s(
    { trig = "text", snippetType = "autosnippet" },
    fmta(
      [[
                \text{<>}
            ]],
      { i(1) }
    ),
    { condition = math }
  ),

  s(
    { trig = "solution" },
    fmta(
      [[
            \begin{solution}
                <>
            \end{solution}
        ]],

      { i(1) }
    )
  ),
  s(
    { trig = "equation" },
    fmta(
      [[
            \begin{equation}
                <>
            \end{equation}
        ]],
      { i(1) }
    )
  ),

  s(
    { trig = "proof" },
    fmta(
      [[
            \begin{proof}
                <>
            \end{proof}
        ]],
      { i(1) }
    )
  ),
  s(
    { trig = "sec" },
    fmta(
      [[
            \section{<>}
        ]],
      { i(1) }
    )
  ),

  s(
    { trig = "beg" },
    fmta(
      [[
            \begin{<>}
            <>
            \end{<>}
        ]],
      { i(1), i(0), rep(1) }
    )
  ),
}
