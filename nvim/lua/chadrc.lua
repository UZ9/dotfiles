---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "one_light" },
  lsp_semantic_tokens = true,
  statusline = {
    theme = "vscode_colored",
  },
  telescope = {
    style = "bordered",
 
  },
  -- Disable tab line 
  tabufline = {
    enabled = false
  },

  -- NOTE: MUST BE DISABLED FOR ANY SORT OF THEME
  transparency = false
}

return M
