require("harpoonline").setup {
  on_update = function()
    vim.cmd.redrawstatus()
  end,
}
