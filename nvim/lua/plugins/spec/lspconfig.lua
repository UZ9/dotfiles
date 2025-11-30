--- @type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
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
    local lspconfig = require "lspconfig"

    lspconfig.lua_ls.setup {}

    -- vim.lsp.config(
    --   "luals",
    --   {
    --     capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
    --     root_markers = { ".git" },
    --     on_attach = function()
    --       -- will do attach keybinds later
    --     end,
    --   }
    -- )

    --local on_attach = require("nvchad.configs.lspconfig").on_attach
    -- local on_init = require("nvchad.configs.lspconfig").on_init
    --local capabilities = require("nvchad.configs.lspconfig").capabilities

    -- lspconfig.ts_ls.setup { autostart = false }

    -- NOTE: bashls doesn't work without shellcheck, this has to be installed

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
    --
    -- lspconfig.lua_ls.setup({
    --     on_init = function(client)
    --       if client.workspace_folders then
    --         local path = client.workspace_folders[1].name
    --         if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
    --           return
    --         end
    --       end
    --
    --       client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
    --         runtime = {
    --           version = 'LuaJIT',
    --           path = { 'lua/?.lua', 'lua/?/init.lua' },
    --         },
    --         workspace = {
    --           checkThirdParty = false,
    --           library = { vim.env.VIMRUNTIME }
    --         }
    --       })
    --     end,
    --     settings = { Lua = {} }
    --   })

    lspconfig.vtsls.setup {
      on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end,
      settings = {
        complete_function_calls = true,
        vtsls = {
          enableMoveToFileCodeAction = true,
          autoUseWorkspaceTsdk = true,
          experimental = {
            maxInlayHintLength = 30,
            completion = {
              enableServerSideFuzzyMatch = true,
            },
          },
        },
        typescript = {
          updateImportsOnFileMove = { enabled = "always" },
          suggest = {
            completeFunctionCalls = true,
          },
          inlayHints = {
            enumMemberValues = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = { enabled = false },
          },
        },
      },
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
