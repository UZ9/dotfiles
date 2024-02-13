local nvim_tree = require('nvim-tree')

local opts = {
    open_on_tab = true,
    hijack_directories = {
        enable = true,
        auto_open = true
    }

}

nvim_tree.setup(opts)

local nvim_tree_api = require('nvim-tree.api')

-- Function for automatically opening nvim tree on startup
local function open_nvim_tree()
    nvim_tree_api.tree.toggle({ focus = false })
end

-- Set nvim-tree to auto open when starting nvim:
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
