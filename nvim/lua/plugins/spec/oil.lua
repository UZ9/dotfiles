---@type LazyPluginSpec
return {
  "stevearc/oil.nvim",
  lazy = false,
  priority = 900,
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<C-h>"] = false, -- disable splitting to allow tmux nav
      ["<C-j>"] = false, -- disable splitting to allow tmux nav
      ["<C-k>"] = false, -- disable splitting to allow tmux nav
      ["<C-l>"] = false, -- disable splitting to allow tmux nav
    },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    { "<leader>e", "<cmd>Oil<cr>", desc = "Open parent directory" },
  },
  keys = {
    {
      "-",
      "<cmd>Oil<cr>",
      desc = "Open parent directory",
    },
  },
}
