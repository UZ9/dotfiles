local dap = require "dap"

local lldb = require "configs.adapter.lldb"

require "configs.dap.dapui"

dap.adapters.lldb = lldb.adapter

dap.configurations.c = lldb.config
dap.configurations.cpp = lldb.config
