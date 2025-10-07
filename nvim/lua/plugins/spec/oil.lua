---@type LazyPluginSpec
return {
  "stevearc/oil.nvim",
  lazy = false,
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true
      },
      keymaps = {
        ["<C-h>"] = false, -- disable splitting to allow tmux nav
        ["<C-j>"] = false, -- disable splitting to allow tmux nav
        ["<C-k>"] = false, -- disable splitting to allow tmux nav
        ["<C-l>"] = false -- disable splitting to allow tmux nav
      },
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
