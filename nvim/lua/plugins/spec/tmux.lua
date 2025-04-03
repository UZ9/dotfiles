---@type LazyPluginSpec
return {
  "aserowy/tmux.nvim",
  config = function()
    require("tmux").setup {
      navigation = {
        enable_default_keybindings = false,
      },
    }
  end,
  lazy = false,
}
