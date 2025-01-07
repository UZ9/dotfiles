local M = {}

---Attempts to load a configuration file for a directory
---@param directory any
function M.load_project_directory(directory)
  print(vim.fn.stdpath "data")
end

return M
