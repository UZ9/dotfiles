---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "everblush",
  transparency = true,
  theme_toggle = {"everblush", "one_light"},
  lsp_semantic_tokens = true,
  statusline = {
    theme = "vscode_colored",
  }

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
