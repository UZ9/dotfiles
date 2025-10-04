---@type LazyPluginSpec
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = {
      "stylua",
      "clangd",
      "bashls",
      "jdtls",

      -- C++ specific
      "clangd",
    },
  },
}
