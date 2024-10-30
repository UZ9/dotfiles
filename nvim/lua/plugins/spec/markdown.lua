---@type Lazy
return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {},
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  ft = { "md", "markdown", "mark" },
  config = function()
    require("render-markdown").setup {}
  end,
}
