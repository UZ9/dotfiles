--- @type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "syntax")
    require("nvim-treesitter.configs").setup(opts)

    vim.treesitter.language.register("markdown", "mdx")
  end,
}
