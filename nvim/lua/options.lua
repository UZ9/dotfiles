require "nvchad.options"

-- Remove line below status; status line gets replaced when running commands 
vim.opt.cmdheight = 0

-- Add conceal for latex previewing
vim.opt.conceallevel = 2

-- IMPORTANT: Reduce latency when typing; should be used with tmux latency config
vim.opt.ttimeoutlen = 0

-- Force relative number
vim.wo.relativenumber = true

-- Custom theme for Neovide
local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end

if vim.g.neovide then
  vim.g.neovide_transparency = 0.85
  vim.g.transparency = 0.85
  vim.g.neovide_background_color = "#0f1117" .. alpha()
end

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
