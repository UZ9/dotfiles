vim.g.vimtex_complete_close_braces = 1
vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.tex_conceal = "abdmgs"

vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"

--- @type LazyPluginSpec
return {
  "lervag/vimtex",
  lazy = false, -- TODO: Move to non-lazy
}
