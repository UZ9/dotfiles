local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Nvim tree navigation
map('n', '<leader>tt', '<Cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>tr', '<Cmd>NvimTreeRefresh<CR>', opts)

-- Telescope navigation
local telescope = require('telescope.builtin')

map('n', '<leader>ff', telescope.find_files, opts)
map('n', '<leader>gr', telescope.live_grep, opts)
map('n', '<leader>gf', telescope.git_files, opts)
