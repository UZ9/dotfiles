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

-- Quickly rearrange lines
-- map("n", "<C-k>", ":m-2<CR>")
-- map("n", "<C-j>", ":m+1<CR>")

map("v", "<", "<gv")
map("v", ">", ">gv")

-- Execute current line in lua
map("n", "<leader>x", "<cmd>.lua<CR>")
map("n", "<leader><leader>x", "<cmd> source %<CR>")

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<Tab>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Compile cmake
map("n", "<leader>rr", "<cmd>make -C build<cr>", { desc = "Compile CMake project" })

map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "tmux navigate left" })
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "tmux navigate down" })
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "tmux navigate up" })
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "tmux navigate right" })
map("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "tmux navigate prev" })

map("n", "<leader>rr", "<cmd>make -C build<cr>", { desc = "Compile CMake project" })
map("n", "<leader>rr", "<cmd>make -C build<cr>", { desc = "Compile CMake project" })
map("n", "<leader>rr", "<cmd>make -C build<cr>", { desc = "Compile CMake project" })
map("n", "<leader>rr", "<cmd>make -C build<cr>", { desc = "Compile CMake project" })

-- nvim-dap
vim.keymap.set("n", "<Leader>b", function()
  require("dap").toggle_breakpoint()
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
