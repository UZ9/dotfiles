local utils = require "utils"

local M = {}

M.adapter = {
  type = "executable",
  command = "ghostty",
  args = { "-e", "/usr/bin/lldb" },
  name = "lldb",
}

M.config = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      -- Check if there's an executable in the workspace folder. If there is,
      -- we default to it
      -- local files = utils.find_executable "/"

      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = function()
      local argument_string = vim.fn.input "Program arguments: "
      return vim.fn.split(argument_string, " ", true)
    end,
  },
}
return M
