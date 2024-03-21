local saturn = {
}

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        theme = "doom",
        config = {
          disable_move = false,
          header = {
            [[                                                ]],
            [[                                          _.oo. ]],
            [[                  _.u[[/;:,.         .odMMMMMM' ]],
            [[               .o888UU[[[/;:-.  .o@P^    MMM^   ]],
            [[              oN88888UU[[[/;::-.        dP^     ]],
            [[             dNMMNN888UU[[[/;:--.   .o@P^       ]],
            [[            ,MMMMMMN888UU[[/;::-. o@^           ]],
            [[            NNMMMNN888UU[[[/~.o@P^              ]],
            [[            888888888UU[[[/o@^-..               ]],
            [[           oI8888UU[[[/o@P^:--..                ]],
            [[        .@^  YUU[[[/o@^;::---..                 ]],
            [[      oMP     ^/o@P^;:::---..                   ]],
            [[   .dMMM    .o@^ ^;::---...                     ]],
            [[  dMMMMMMM@^`       `^^^^                       ]],
            [[ YMMMUP^                                        ]],
            [[  ^^                                            ]],
            [[                                                ]],
          },
          center = {
            {
              icon = "",
              icon_hl = "group",
              desc = "",
              desc_hl = "group",
              -- key = 'shortcut key in dashboard buffer',
              key_hl = "group",
              action = "",
            },
          },
          footer = {}, --your footer
        },
      }
    end,
    dependencies = {{ "nvim-tree/nvim-web-devicons" }}
  }

  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },

  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
