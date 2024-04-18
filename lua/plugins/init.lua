local quotes = {
  "If anyone here believes in telekinesis, raise my hand.",
  "I can resist everything except temptation",
  "Jazz isn't dead, it just smells funny",
  "What are you DOING?",
  "Anywhere is walking distance if you've got the time",
  "I was hustled, scammed, bamboozled, hood winked, and lead astray",
}

local function get_quote()
  -- Switch up seed, as it seems to be seeded by default for nvim
  math.randomseed(os.time())
  return quotes[math.random(1, #quotes)]
end

return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "typescript-language-server",
        "rls",
        "clangd",
        "java-language-server",
        "jdtls",
      },
    },
  },
  {
    "charludo/projectmgr.nvim",
    lazy = false,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require "null-ls"

      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)

      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
