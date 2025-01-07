---@type LazyPluginSpec
return {
  "stevearc/oil.nvim",
  lazy = false,
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true
      }
    })

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
  keys = {
    {
      "-",
      "<cmd>Oil<cr>",
      desc = "Open parent directory",
    },
  },
}
