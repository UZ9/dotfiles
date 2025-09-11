---@type NvPluginSpec
return {
  "ej-shafran/compile-mode.nvim",
  version = "^5.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
    }
  end
}
