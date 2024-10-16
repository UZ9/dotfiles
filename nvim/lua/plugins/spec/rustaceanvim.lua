---@type LazyPluginSpec
return {
  "mrcjkb/rustaceanvim",
  version = "^4",
  lazy = false, -- rustaceanvim is already lazy
  config = function() end,
  keys = {
    { "<leader>cR", "<cmd>RustLsp codeAction<cr>", desc = "Rust code action" },
    { "<leader>dr", "<cmd>RustLsp debuggables<cr>", desc = "Rust debuggables " },
  },
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
