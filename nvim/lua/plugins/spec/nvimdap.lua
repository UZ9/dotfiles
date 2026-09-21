---@type LazyPluginSpec
return {
  "mfussenegger/nvim-dap",
  dependencies = {
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

    -- open source cpp dap sucks so let's just steal the vscode one
    local cpptools_adapters = vim.fn.glob(
      vim.fn.expand "~/.vscode/extensions/ms-vscode.cpptools-*/debugAdapters/bin/OpenDebugAD7",
      false,
      true
    )
    table.sort(cpptools_adapters)

    local cppdbg = cpptools_adapters[#cpptools_adapters]

    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = cppdbg,
    }

    local launch_json_provider = dap.providers.configs["dap.launch.json"]

    -- latch onto xv6 debugger if possible 
    -- TODO: need to figure out a way to have this config entirely within the project to not require others to check for this
    dap.providers.configs["dap.launch.json"] = function(bufnr)
      local configurations = launch_json_provider(bufnr)
      for _, configuration in ipairs(configurations) do
        if configuration.name == "xv6: Attach to ./ag run --gdb" then
          configuration.launchCompleteCommand = "None"
        end
      end
      return configurations
    end

    local function set_dap_highlights()
      vim.api.nvim_set_hl(0, "DapStopped", { link = "Visual" })
    end

    set_dap_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("dap_highlights", { clear = true }),
      callback = set_dap_highlights,
    })

    local sign = vim.fn.sign_define

    sign("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
    sign("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
  end,
}
