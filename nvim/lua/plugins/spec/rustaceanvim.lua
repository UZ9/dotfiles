---@type LazyPluginSpec
return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  -- lazy = false, -- rustaceanvim is already lazy
  ft = "rust",
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = require("nvchad.configs.lspconfig").on_attach,
      },
    }
  end,
  opts = {
    server = {
      cmd = function()
        local mason_registry = require "mason-registry"
        local ra_binary = mason_registry.is_installed "rust-analyzer"
            -- This may need to be tweaked, depending on the operating system.
            and mason_registry.get_package("rust-analyzer"):get_install_path() .. "/rust-analyzer"
          or "rust-analyzer"
        return { ra_binary } -- You can add args to the list, such as '--log-file'
      end,
      default_settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            buildScripts = {
              enable = true,
            },
          },
          checkOnSave = true,
          procMacro = {
            enable = true,
            ignored = {
              ["async-trait"] = { "async_trait" },
              ["napi-derive"] = { "napi" },
              ["async-recursion"] = { "async_recursion" },
            },
          },
        },
      },
    },
  },
}
