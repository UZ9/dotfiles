---@type LazyPluginSpec
return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  ft = "rust",
  init = function()
    vim.g.rustaceanvim = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              target = "x86_64-unknown-linux-gnu"
            },
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
