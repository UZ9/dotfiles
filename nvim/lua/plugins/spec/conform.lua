---@type NvPluginSpec
return {
  "stevearc/conform.nvim",
  lazy = false,
  config = function()
    local options = {
      formatters_by_ft = {
        lua = { "stylua" },
        yaml = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
      },
    }

    require("conform").setup(options)
  end,
}
