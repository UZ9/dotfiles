local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt

local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

return {
    s({ trig="not", snippetType="autosnippet" },
        { t("\\lnot") },
        { condition = math }
    ),
    s({ trig="or", snippetType="autosnippet" },
        { t("\\lor") },
        { condition = math }
    ),

    s({ trig="and", snippetType="autosnippet" },
        { t("\\land") },
        { condition = math }
    ),

    s({ trig="to", snippetType="autosnippet" },
        { t("\\to") },
        { condition = math }
    ),

    s({ trig="equiv", snippetType="autosnippet" },
        { t("\\equiv") },
        { condition = math}
    ),

    s({ trig="===", snippetType="autosnippet" },
        { t("\\equiv") },
        { condition = math }
    ),

    s({ trig="text", snippetType="autosnippet" },
        fmta(
            [[
                \text{<>}
            ]],
            { i(1) }
            ),
        { condition = math }
    ),

    s({ trig="solution"},
    fmta(
        [[
            \begin{solution}
                <>
           \end{solution}
        ]],

        { i(1) }
    )),

    s({ trig="mk", snippetType = "autosnippet"},
    fmta(
        [[
            $<>$
        ]],
        { i(1) }
    )),

    s({ trig="beg"},
    fmt([[
        \begin{<>}
            <>
        \end{<>}
    ]], {
        i(1),
        i(0),
        rep(1),
    }, { delimiters = "<>" } )),

    s({ trig="equation"},
    fmta(
        [[
            \begin{equation}
                <>
            \end{equation}
        ]],
        { i(1) }
    )),

    s({ trig="proof"},
    fmta(
        [[
            \begin{proof}
                <>
            \end{proof}
        ]],
        { i(1) }
        )
    ),

    s({ trig= "sometest"},
    fmta(
        [[
            \begin <>
        ]], { i(1) })
    ),

    s({ trig="([^%a])//", snippetType = "autosnippet", wordTrig = false, regTrig = true },
    fmta(
        [[
            <>\frac{<>}{<>}
        ]], { 
            f( function(_, snip) return snip.captures[1] end ),
            i(1),
            i(2) }
    )


    ),

    s({ trig="((\\d+)|(\\d*)(\\\\)?([A-Za-z]+)((\\^|_)(\\{\\d+\\}|\\d))*)/", snippetType="autosnippet", trigEngine="ecma"},
    fmta(
        [[
            \frac{<>}{<>}<>
        ]], { f(function (_, snip)
            return snip.captures[1]
        end), i(1), i(0) })
        )
    }
