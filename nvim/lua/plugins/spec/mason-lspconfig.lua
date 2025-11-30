---@type LazyPluginSpec
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig"
  },
  opts = {
    ensure_installed = {
      "stylua",
      "luals",
      "clangd",
      "bashls",
      "jdtls",
      "jsonls",

      -- C++ specific
      "clangd",
    },
  },
  config = function()
    require("mason-lspconfig").setup {
      automatic_enable = {
        exclude = {
          "rust_analyzer"
        }
      },
      automatic_setup = true,
    }
  end,
}
