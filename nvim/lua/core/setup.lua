local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
-- vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#e85a43" })

-------- Lazy.nvim initialization --------
if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-------- NVChad initialization --------
-- load plugins
require("lazy").setup({
  -- {
  --   "NvChad/NvChad",
  --   lazy = false,
  --   branch = "v2.5",
  --   import = "nvchad.plugins",
  --   config = function()
  --     require "options"
  --   end,
  -- },

  { import = "plugins" },
}, lazy_config)

-- Load theme
-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")

-- Load mappings
vim.schedule(function()
  -- require "nvchad.autocmds"
  require "mappings"
  require "options"
end)

require("tokyonight").load()
