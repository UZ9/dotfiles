-- Remove line below status; status line gets replaced when running commands
vim.opt.cmdheight = 0

-- Add conceal for latex previewing
vim.opt.conceallevel = 2

-- IMPORTANT: Reduce latency when typing; should be used with tmux latency config
vim.opt.ttimeoutlen = 0

-- Force relative number
vim.opt.relativenumber = true
vim.opt.number = true

-- Highlight current line
vim.opt.cursorline = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- smartcase when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Custom theme for Neovide
local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end

if vim.g.neovide then
  vim.g.neovide_transparency = 0.85
  vim.g.transparency = 0.85
  vim.g.neovide_background_color = "#0f1117" .. alpha()
end

-- inline diagnostic to getinline errors
vim.diagnostic.config { virtual_text = true }

--  Add mdx filetype
vim.filetype.add {
  extension = {
    mdx = "mdx",
  },
  shader = "hlsl",
  hlsl = "hlsl",
  vertexshader = "hlsl",
  fragmentshader = "hlsl",
}

-- inlay hints (e.g. type recommendations)
vim.lsp.inlay_hint.enable(true)
