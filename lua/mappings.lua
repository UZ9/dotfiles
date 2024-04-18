require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Remap ctrl + d and ctrl + b to center the page 
map("n", "<C-d>", "<C-d>zz", { desc = "Move down half a page and center" })
map("n", "<C-b>", "<C-b>zz", { desc = "Move up half a page and center" })
