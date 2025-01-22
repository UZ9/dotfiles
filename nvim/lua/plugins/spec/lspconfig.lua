--- @type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local on_init = require("nvchad.configs.lspconfig").on_init
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    local lspconfig = require "lspconfig"
    local servers = { "html", "cssls", "jdtls", "tsserver", "yamlls", "clangd", "cmake", "bashls", }

    -- lsps with default config
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
    end

    -- typescript
    lspconfig.ts_ls.setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    }

    lspconfig.bashls.setup {
      filetypes = { "zsh", "sh" },
    }

    lspconfig.verible.setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
      filetypes = { "sv", "systemverilog" }
    }

    lspconfig.yamlls.setup {
      lspconfig.yamlls.setup {
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = true
          on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        settings = {
          yaml = {
            format = {
              enable = true,
            },
            schemaStore = {
              enable = true,
            },
          },
        },
      },
    }
  end,
}
