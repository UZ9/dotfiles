---@type LazyPluginSpec
return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  enabled = true,
  lazy = false,
  init = function()
    vim.g.rustaceanvim = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            inlayHints = {
              typeHints = true,
              chainingHints = true,
              parameterHints = true,
              closingBraceHints = {
                enable = true,
              },
            },
          },
        },
      },
    }
  end,
}
