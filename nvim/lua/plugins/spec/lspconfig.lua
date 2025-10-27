--- @type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
  },
  opts = function()
    local ret = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      inlay_hints = {
        enabled = true,
        exlude = { "vue" },
      },
      codelens = {
        enabled = false,
      },
      folds = {
        enabled = true,
      },
    }

    return ret
  end,
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  config = function()
    --local on_attach = require("nvchad.configs.lspconfig").on_attach
    -- local on_init = require("nvchad.configs.lspconfig").on_init
    --local capabilities = require("nvchad.configs.lspconfig").capabilities

    lspconfig.ts_ls.setup { autostart = false }

    local lspconfig = require "lspconfig"
    local servers = { "html", "cssls", "jdtls", "clangd", "cmake", "bashls", "gopls", "pyright" }

    -- lsps with default config
    -- for _, lsp in ipairs(servers) do
    --   lspconfig[lsp].setup {
    --     on_attach = on_attach,
    --     on_init = on_init,
    --     capabilities = capabilities,
    --   }
    -- end

    -- typescript
    -- lspconfig.ts_ls.setup {
    --   on_attach = on_attach,
    --   on_init = on_init,
    --   capabilities = capabilities,
    -- }

    lspconfig.bashls.setup {
      filetypes = { "zsh", "sh" },
    }

    lspconfig.verible.setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
      filetypes = { "sv", "systemverilog" },
    }

    -- not sure how i missed this my whole life, but json schemas for everyone!
    -- no more manually entering schemas...
    lspconfig.jsonls.setup {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
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
