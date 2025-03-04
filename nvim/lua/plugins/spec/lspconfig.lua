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
    local servers = { "html", "cssls", "jdtls", "ts_ls", "clangd", "cmake", "bashls", "gopls" }

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
      filetypes = { "sv", "systemverilog" },
    }

    lspconfig.yamlls.setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
      settings = {
        yaml = {
          schemas = {
            ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "/*",
          },
          format = {
            enable = true,
          },
          hover = true,
          completion = true,
          schemaStore = {
            enable = true,
          },

          customTags = {
            "!fn",
            "!And",
            "!If",
            "!Not",
            "!Equals",
            "!Or",
            "!FindInMap sequence",
            "!Base64",
            "!Cidr",
            "!Ref",
            "!Ref Scalar",
            "!Sub",
            "!GetAtt",
            "!GetAZs",
            "!ImportValue",
            "!Select",
            "!Split",
            "!Join sequence",
          },
        },
      },
    }
  end,
}
