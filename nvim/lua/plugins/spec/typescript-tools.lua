---@type NvPluginSpec
return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  config = function()
    require("typescript-tools").setup {
      settings = {
        -- expose_as_code_action = { "add_missing_imports", "remove_unused", "remove_unused_imports", "organize_imports" },
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact", "javascript", "typescript" },
        },
      },
      on_attach = function()
        vim.keymap.set("n", "<leader>ca", function()
          vim.lsp.buf.code_action()
        end)

        vim.keymap.set("v", "<leader>ca", function()
          vim.lsp.buf.code_action()
        end)
      end,
    }
  end,
}
