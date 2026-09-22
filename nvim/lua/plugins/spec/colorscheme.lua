return {
  "shatur/neovim-ayu",
  lazy = false,
  config = function()
    require('ayu').setup({
        mirage = false,
        terminal = true,
        overrides = {},
    })

    vim.cmd "colorscheme ayu-mirage"
  end
}
