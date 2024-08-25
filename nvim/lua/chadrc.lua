---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "nightfox",
  theme_toggle = { "nightfox", "one_light" },
  lsp_semantic_tokens = true,
  statusline = {
    theme = "vscode_colored",
  },
  telescope = {
    style = "bordered",
  },
  lsp = {
    signature = {
      disabled = false,
      silent = true
    }
  }
}

return M
