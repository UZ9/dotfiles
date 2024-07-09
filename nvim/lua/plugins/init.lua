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
    "mrcjkb/rustaceanvim",
    version = '^4',
    lazy = false -- already lazy
  },
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
    -- Custom local plugin
    dir = "C:\\Users\\ryder\\Documents\\Code\\latex-drawings.nvim",
    lazy = false,
    opts = {
      name = "Ryder",
    },
    dependencies = { "nvim-telescope/telescope.nvim" }
  },
  {
    "lervag/vimtex",
    lazy = false
  },
  {
    "NvChad/ui",
    dependencies = {
      "abeldekat/harpoonline",
      config = function()
        require("harpoonline").setup {
          on_update = function()
            vim.cmd.redrawstatus()
          end,
        }
      end,
    },
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
    d,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)

      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
  {
    "folke/which-key.nvim",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
      local present, wk = pcall(require, "which-key")
      if not present then
        return
      end

      local latexdrawings = require "latexdrawings"

      wk.register {
        -- add group
        ["<leader>rs"] = { "<cmd>BeginDrawing<cr>", "Begin Drawing" },
      }
    end,
    setup = function()
      require("core.utils").load_mappings "whichkey"
    end,
  },
}
