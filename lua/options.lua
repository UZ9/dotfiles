require "nvchad.options"

-- -- Additional Configurations
vim.opt.conceallevel = 2

-- Force relative number
vim.wo.relativenumber = true

-- Initialize LuaSnip
require("luasnip.loaders.from_lua").load({paths = "./lua_snippets"})

require("luasnip").config.set_config({
    enable_autosnippets = true,
})

print("Hello")
print(vim.fn.stdpath "config" .. "/lua_snippets")

-- Load in snippets
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "\\lua" .. "\\lua_snippets"

local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end

-- Theme
if vim.g.neovide then
  vim.g.neovide_transparency = 0.85
  vim.g.transparency = 0.85
  vim.g.neovide_background_color = "#0f1117" .. alpha()
end
