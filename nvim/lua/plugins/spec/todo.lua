---@type LazyPluginSpec
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function(_, _)
    require("todo-comments").setup {}
  end,
}
