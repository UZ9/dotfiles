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
      "jsonls",

      -- C++ specific
      "clangd",
    },
  },
  config = function()
	  require("mason-lspconfig").setup{
		  automatic_enable = false,
		  automatic_setup = false
	  }
  end
}
