---@type LazyPluginSpec
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, { "cpp-debug-adapter" })
        end
      end,
    },
  },
  config = function()
    local dap = require "dap"

    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = "~/Downloads/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
    }
    -- todo: don't hardcode cpptools (mason is supposed to be able to install this but it got removed for whatever reason)
    dap.configurations.c = {
      {
        name = "Debug xv6 Kernel",
        type = "cppdbg",
        request = "launch",
        program = vim.fn.expand "~/Classes/CS3210/xv6/build/kernel/kernel",
        miDebuggerServerAddress = "localhost:1234",

        sourceFileMap = {
          ["/xv6"] = vim.fn.expand "~/Classes/CS3210/xv6",
        },

        miDebuggerPath = "/usr/bin/gdb",
        cwd = "${workspaceFolder}",

        setupCommands = {
          {
            text = "source " .. vim.fn.expand "~/Classes/CS3210/debug/xv6.gdbinit",
            description = "Load xv6 GDB hooks",
            ignoreFailures = false,
          },
        },
      },
    }

    local sign = vim.fn.sign_define

    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
    sign("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
  end,
}
