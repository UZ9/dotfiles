return {
  event = "VeryLazy",
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },

  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "enter" },

    appearance = {
      nerd_font_variant = "mono",
    },

    signature = { enabled = true },

    completion = { documentation = { auto_show = true } },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          override = {
            -- i love verilog verilog makes me happy verilog lsps have no problems verilog does not require any extra work
            get_trigger_characters = function(self)
              local chars = self:get_trigger_characters() or {}
              vim.list_extend(chars, { "." })
              return chars
            end,
          },
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
