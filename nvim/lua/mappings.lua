require "nvchad.mappings"

local utils = require "utils"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Lazy redrawing prevents flicker when skipping down and recentering at the top or bottom
local function execute_lazy(keys)
  keys = vim.api.nvim_replace_termcodes(keys, true, false, true)

  return function()
    local old = vim.o.lazyredraw
    vim.o.lazyredraw = true
    vim.api.nvim_feedkeys(keys, "nx", false)
    vim.o.lazyredraw = old
  end
end

-- Remap ctrl + d and ctrl + b to center the page
map("n", "<C-d>", execute_lazy "<C-d>zz", { desc = "Move down half a page and center" })
map("n", "<C-b>", execute_lazy "<C-b>zz", { desc = "Move up half a page and center" })

map("v", "<", "<gv")
map("v", ">", ">gv")

-- Execute current line in lua
map("n", "<leader>x", "<cmd>.lua<CR>")
map("n", "<leader><leader>x", "<cmd> source %<CR>")

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<Tab>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Compile cmake
map("n", "<leader>rr", "<cmd>make -C build<cr>", { desc = "Compile CMake project" })

-- seamless vim split and tmux nav
map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "tmux navigate left" })
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "tmux navigate down" })
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "tmux navigate up" })
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "tmux navigate right" })
map("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "tmux navigate prev" })

-- split shorthand
map("n", "<m-l>", ":vsplit<cr>", { desc = "split vertical" })
map("n", "<m-h>", ":split<cr>", { desc = "split horizontal" })

-- search for functions in project
map("n", "<leader>fr", function()
  require("telescope.builtin").lsp_workspace_symbols({ symbols={'function', 'method'} })
end)

-- nvim-dap
vim.keymap.set("n", "<Leader>b", function()
  require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "<Leader>tt", function()
  require("dapui").toggle()
end)

vim.keymap.set("n", "<Leader>tr", function()
  -- start gdb server
  local job_id = vim.fn.jobstart({'ghostty', '-e', '~/Classes/CS3210/xv6/scripts/docker.sh', '--attach'}, {
  on_stdout = function(_, data, _)
    for _, line in ipairs(data) do
      vim.print(line)
    end
  end,
})

  -- turn on debugger
  require("dapui").toggle()

  -- start debugging 
  require("dap").continue()
end)

vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end)

vim.keymap.set("n", "<Leader>dl", function()
  require("dap").run_last()
end)
vim.keymap.set("n", "<Leader>df", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end)

-- Quickfix list navigation
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz", {
  desc = "Quickfix forward",
  silent = true,
})

vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz", {
  desc = "Quickfix backward",
  silent = true,
})
