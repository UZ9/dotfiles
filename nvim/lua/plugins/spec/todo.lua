---@type LazyPluginSpec
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  config = function (_, _)
    require("todo-comments").setup{}
  end
}
