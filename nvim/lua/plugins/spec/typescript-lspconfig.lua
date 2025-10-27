return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "yioneko/nvim-vtsls", -- optional but recommended for vtsls
  },
  config = function()
    local lspconfig = require("lspconfig")
    
    -- Helper function to execute LSP commands
    local function execute_command(command, args)
      vim.lsp.buf.execute_command({
        command = command,
        arguments = args or {},
      })
    end
    
    -- Helper function for code actions
    local function get_code_action(action_kind)
      return function()
        vim.lsp.buf.code_action({
          context = {
            only = { action_kind },
            diagnostics = {},
          },
          apply = true,
        })
      end
    end
    
    
    -- Handle deno/vtsls conflict if needed
    if vim.lsp.config.denols and vim.lsp.config.vtsls then
      local function resolve(server)
        local markers = vim.lsp.config[server].root_markers
        local root_dir = vim.lsp.config[server].root_dir
        vim.lsp.config(server, {
          root_dir = function(bufnr, on_dir)
            local is_deno = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) ~= nil
            if is_deno == (server == "denols") then
              if root_dir then
                return root_dir(bufnr, on_dir)
              elseif type(markers) == "table" then
                local root = vim.fs.root(bufnr, markers)
                return root and on_dir(root)
              end
            end
          end,
        })
      end
      resolve("denols")
      resolve("vtsls")
    end
    
    -- Configure vtsls
    lspconfig.vtsls.setup({
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
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
        javascript = {
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
      on_attach = function(client, bufnr)
        -- Set up keymaps
        local opts = { buffer = bufnr, silent = true }
        
        -- Go to source definition
        vim.keymap.set("n", "gD", function()
          local params = vim.lsp.util.make_position_params()
          execute_command("typescript.goToSourceDefinition", {
            params.textDocument.uri,
            params.position,
          })
        end, vim.tbl_extend("force", opts, { desc = "Goto Source Definition" }))
        
        -- File references
        vim.keymap.set("n", "gR", function()
          execute_command("typescript.findAllFileReferences", {
            vim.uri_from_bufnr(0),
          })
        end, vim.tbl_extend("force", opts, { desc = "File References" }))
        
        -- Code actions
        vim.keymap.set("n", "<leader>co", get_code_action("source.organizeImports"),
          vim.tbl_extend("force", opts, { desc = "Organize Imports" }))
        
        vim.keymap.set("n", "<leader>cM", get_code_action("source.addMissingImports.ts"),
          vim.tbl_extend("force", opts, { desc = "Add missing imports" }))
        
        vim.keymap.set("n", "<leader>cu", get_code_action("source.removeUnused.ts"),
          vim.tbl_extend("force", opts, { desc = "Remove unused imports" }))
        
        vim.keymap.set("n", "<leader>cD", get_code_action("source.fixAll.ts"),
          vim.tbl_extend("force", opts, { desc = "Fix all diagnostics" }))
        
        -- Select TypeScript version
        vim.keymap.set("n", "<leader>cV", function()
          execute_command("typescript.selectTypeScriptVersion")
        end, vim.tbl_extend("force", opts, { desc = "Select TS workspace version" }))
      end,
    })
    
    -- Use Snacks for move to file refactoring
    Snacks.util.lsp.on({ name = "vtsls" }, function(buffer, client)
      client.commands["_typescript.moveToFileRefactoring"] = function(command, ctx)
        local action, uri, range = unpack(command.arguments)
        
        local function move(newf)
          client:request("workspace/executeCommand", {
            command = command.command,
            arguments = { action, uri, range, newf },
          })
        end
        
        local fname = vim.uri_to_fname(uri)
        client:request("workspace/executeCommand", {
          command = "typescript.tsserverRequest",
          arguments = {
            "getMoveToRefactoringFileSuggestions",
            {
              file = fname,
              startLine = range.start.line + 1,
              startOffset = range.start.character + 1,
              endLine = range["end"].line + 1,
              endOffset = range["end"].character + 1,
            },
          },
        }, function(_, result)
          local files = result.body.files
          table.insert(files, 1, "Enter new path...")
          vim.ui.select(files, {
            prompt = "Select move destination:",
            format_item = function(f)
              return vim.fn.fnamemodify(f, ":~:.")
            end,
          }, function(f)
            if f and f:find("^Enter new path") then
              vim.ui.input({
                prompt = "Enter move destination:",
                default = vim.fn.fnamemodify(fname, ":h") .. "/",
                completion = "file",
              }, function(newf)
                return newf and move(newf)
              end)
            elseif f then
              move(f)
            end
          end)
        end)
      end
    end)
  end,
}
