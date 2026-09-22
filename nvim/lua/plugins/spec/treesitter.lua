--- @type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup {
      install_dir = vim.fn.stdpath("data") .. "/site",
    }
    vim.treesitter.language.register("markdown", "mdx")
  end,
}
