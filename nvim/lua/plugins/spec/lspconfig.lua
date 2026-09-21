--- @type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  ft = { "lua", "typescript", "javascript", "json", "yaml", "sh", "zsh", "c", "cpp", "go", "python", "java", "verilog" },
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
    -- NOTE: bashls doesn't work without shellcheck, this has to be installed

    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    vim.lsp.config("lua_ls", {})

    vim.lsp.config("vtsls", {
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
    })

    vim.lsp.config("bashls", {
      filetypes = { "zsh", "sh" },
    })

    -- TODO: i already wasted far too much time getting verilog to work it can be hardcoded to lab0 for now
    vim.lsp.config("svlangserver", {
      filetypes = { "verilog", "systemverilog" },
      settings = {
        systemverilog = {
          includeIndexing = { "**/*.{v,vh,sv,svh}" },
          excludeIndexing = {},
          launchConfiguration = "verilator --lint-only -Wall -y ~/Classes/cs3220/lab0 +libext+.v",
          formatCommand = "verible-verilog-format",
        },
      },
    })

    --vim.lsp.config("verible", {
    --  cmd = { "verible-verilog-ls", "--rules=-module-filename" },
    --  filetypes = { "verilog", "systemverilog" },
    --})

    -- not sure how i missed this my whole life, but json schemas for everyone!
    -- no more manually entering schemas...
    vim.lsp.config("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    vim.lsp.config("yamlls", {
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = true
      end,
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
    })

    vim.lsp.enable { "lua_ls", "vtsls", "bashls", "svlangserver", "jsonls", "yamlls" }
  end,
}
