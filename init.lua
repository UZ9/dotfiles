vim.opt.termguicolors = true

vim.g.netrw_keepdir = 0

vim.api.nvim_exec(
[[
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
]], true)

--vim.g.vimtex_view_general_options.latexmk = '-reuse-instance'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
  "folke/which-key.nvim",
  "dense-analysis/ale",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  { "lervag/vimtex" },
  "folke/neodev.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "neoclide/coc.nvim" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.3", dependencies = { 'nvim-lua/plenary.nvim' } },
  { "nvim-tree/nvim-web-devicons" },
  { "vim-airline/vim-airline" },
  {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
  }
})


local set = vim.opt

-- Set tab amounts 
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.conceallevel = 2

set.number = true

vim.cmd.colorscheme "catppuccin-macchiato"

-- Configure telescope 
local builtin = require('telescope.builtin')

require("luasnip.loaders.from_lua").load({paths = "./LuaSnip"})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("luasnip").config.set_config({
    enable_autosnippets = true,
})

vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

vim.g.vimtex_complete_close_braces = 1
vim.g.vimtex_view_general_viewer = "SumatraPDF"
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.tex_conceal = 'abdmgs'

vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
