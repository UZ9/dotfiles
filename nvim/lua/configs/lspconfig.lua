-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "jdtls", "tsserver", "clangd", "yamlls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
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
