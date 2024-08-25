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

return M
