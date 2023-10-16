vim.opt.termguicolors = true

vim.g.netrw_keepdir = 0

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
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "lervag/vimtex",
  "folke/neodev.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "neoclide/coc.nvim" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.3", dependencies = { 'nvim-lua/plenary.nvim' } },
  { "nvim-tree/nvim-web-devicons" },
  { "vim-airline/vim-airline" },
})


local set = vim.opt

-- Set tab amounts 
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

set.number = true

vim.cmd.colorscheme "catppuccin-macchiato"

-- Configure telescope 
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

