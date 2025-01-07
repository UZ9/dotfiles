--- Utilities file for nvim config
local M = {}

function M.get_lua_files(directory)
  local plugins = {}

  local files = vim.fn.glob(vim.fn.stdpath "config" .. "/lua/" .. directory .. "/*.lua", false, true)

  for _, file in ipairs(files) do
    -- Fetch path to import, insert into list
    local name = directory .. "." .. vim.fn.fnamemodify(file, ":t:r")

    table.insert(plugins, { import = name })
  end

  return plugins
end

local UNRESOLVED_IMPORTS_CODE = "E0433"

--- Utility function for looping through all import actions if the functionality insn't part
--- of the native LSP. It seems like there currently isn't any import all for rust-analyzer
--- with rustaceanvim, so this is a temporary workaround.
function M.rust_analyzer_attempt_import_all()
  local bufnr = vim.api.nvim_get_current_buf()

  local diagnostics = vim.diagnostic.get(bufnr)

  for _, diagnostic in pairs(diagnostics) do
    if diagnostic.source == "rustc" and diagnostic.code == UNRESOLVED_IMPORTS_CODE then
      vim.api.nvim_win_set_cursor(0, { diagnostic.lnum + 1, diagnostic.col })
      vim.lsp.buf.code_action()
    end
  end
end

return M
