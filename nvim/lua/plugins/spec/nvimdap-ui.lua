---@type LazyPluginSpec
return {
  "rcarriga/nvim-dap-ui",
  lazy = false,
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    require("dapui").setup()
  end,
}
