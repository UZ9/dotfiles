---@type ChadrcConfig
local M = {}

vim.api.nvim_set_hl(0, "DapStopped", { bg = "#15181d", fg = "#FFFFFF", bold = true })

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "one_light" },
  lsp_semantic_tokens = true,
  statusline = {
    enabled = false
  },
  telescope = {
    style = "bordered",
  },
  -- Disable tab line
  tabufline = {
    enabled = false,
  },

  -- NOTE: MUST BE DISABLED FOR ANY SORT OF THEME
  transparency = false,
}

return M
