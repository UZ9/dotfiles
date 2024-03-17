-- VIMPLUG ALIASES
local vim = vim
local Plug = vim.fn['plug#']

-- ESSENTIAL CONFIG VARIABLES
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.call('plug#begin')

-- INITIALIZE PLUGINS

-- Snippets
Plug('L3MON4D3/LuaSnip', { ['tag'] = 'v2.*', ['do'] = 'make install_jsregexp'})

-- LaTeX
Plug('lervag/vimtex')

-- Telescope search
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')

-- nvim-tree
Plug('kyazdani42/nvim-web-devicons')
Plug('kyazdani42/nvim-tree.lua')

-- LSP
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('nvim-lua/lsp-status.nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('simrat39/rust-tools.nvim')

-- LaTeX-specific autocomplete
Plug ("kdheepak/cmp-latex-symbols")

-- Autocompletion
Plug ('hrsh7th/cmp-nvim-lsp')
Plug ('hrsh7th/cmp-nvim-lua')
Plug ('hrsh7th/cmp-buffer')
Plug ('hrsh7th/cmp-path')
Plug ('hrsh7th/cmp-cmdline')
Plug ('hrsh7th/cmp-calc')
Plug ('hrsh7th/nvim-cmp', {['sources'] = {
    {
        name = "latex_symbols",
        options = {
            strategy = 0, -- mixed
        },
    },

}})

-- THEME
Plug('ellisonleao/gruvbox.nvim')

vim.call('plug#end')

vim.o.background = 'dark'
vim.cmd([[colorscheme gruvbox]])

-- CONFIGURE PLUGINS
require('plugins')
require('mappings')

local set = vim.opt

-- Set tab amounts 
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.conceallevel = 2

set.number = true

-- Configure telescope 
-- local builtin = require('telescope.builtin')

-- Initialize LuaSnip
require("luasnip.loaders.from_lua").load({paths = "./LuaSnip"})

--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("luasnip").config.set_config({
    enable_autosnippets = true,
})

--vim.cmd[[
--" Use Tab to expand and jump through snippets
--imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
--smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

--" Use Shift-Tab to jump backwards through snippets
--imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
--smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
--]]

-- TODO: Add support for table-based snippets
vim.cmd[[
" Add shift-tab functionality for insert mode
inoremap <S-Tab> <C-d> 
]]

-- Configure VimTex
vim.g.vimtex_complete_close_braces = 1
vim.g.vimtex_view_general_viewer = "SumatraPDF"
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.tex_conceal = 'abdmgs'

vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
