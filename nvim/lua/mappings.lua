require "nvchad.mappings"

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

-- Compile cmake 
map("n", "<leader>rr", "<cmd>make -C build<cr>", { desc = "Compile CMake project" })
