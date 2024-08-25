---@type LazyPluginSpec
return {
  -- TODO: Set lazy configuration to trigger on certain files?
  "mfussenegger/nvim-dap",
  config = function()
    require "configs.dap"
  end,
  lazy = false,
}
