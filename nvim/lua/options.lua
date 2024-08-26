require "nvchad.options"

-- -- Additional Configurations
vim.opt.conceallevel = 2

-- IMPORTANT: Reduce latency when typing; should be used with tmux latency config
vim.opt.ttimeoutlen = 0

-- Force relative number
vim.wo.relativenumber = true

local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end

-- Theme
if vim.g.neovide then
  vim.g.neovide_transparency = 0.85
  vim.g.transparency = 0.85
  vim.g.neovide_background_color = "#0f1117" .. alpha()
end

--  Add filetype of vim
vim.filetype.add {
  extension = {
    mdx = "mdx",
  },
}
