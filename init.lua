-- VIMPLUG ALIASES
local vim = vim

-- ESSENTIAL CONFIG VARIABLES
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.lsp.set_log_level("trace")
vim.opt.fillchars = {eob = " "}

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

-- INITIALIZE PLUGINS

local plugins = {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },
    {
        "lervag/vimtex"
    },
    {
        "nvim-lua/plenary.nvim"
    },
    {
        "nvim-telescope/telescope.nvim"
    },
    {
        "kyazdani42/nvim-web-devicons"
    },
    {
        "kyazdani42/nvim-tree.lua"
    },
    {
        "eandrju/cellular-automaton.nvim"
    },
    {
        "williamboman/mason.nvim"
    },
    {
        "williamboman/mason-lspconfig.nvim"
    },
    {
        "neovim/nvim-lspconfig"
    },
    {
        "nvim-lua/lsp-status.nvim"
    },
    {
        "nvim-treesitter/nvim-treesitter", 
        build=":TSUpdate"
    },
    {
        "simrat39/rust-tools.nvim"
    },
    {
        "kdheepak/cmp-latex-symbols"
    },
    {
        "nvim-lualine/lualine.nvim"
    },
    {
        "rstacruz/vim-closer"
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-calc",
    {
        "hrsh7th/nvim-cmp",
        sources = {
            name = "latex_symbols",
            options = {
                strategy = 0, -- mixed
            },
        }
    },
    "dstein64/vim-startuptime",
    "ful1e5/onedark.nvim"
}


require("lazy").setup(plugins)

require('onedark').setup()

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

-- Initialize LuaSnip
require("luasnip.loaders.from_lua").load({paths = "./LuaSnip"})

require("luasnip").config.set_config({
    enable_autosnippets = true,
})

-- TODO: Add support for table-based snippets
vim.cmd[[
" Add shift-tab functionality for insert mode
inoremap <S-Tab> <C-d> 
]]

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Configure VimTex
vim.g.vimtex_complete_close_braces = 1
vim.g.vimtex_view_general_viewer = "SumatraPDF"
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.tex_conceal = 'abdmgs'

vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

-- Initialize lualine
require('lualine').setup {
    options = {
        theme = "onedark-nvim"
    }
}
