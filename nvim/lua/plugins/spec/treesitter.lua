--- @type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "syntax")

    local preinstalled_langs = {
      ensure_installed = { "bash", "python", "lua", "yaml", "json", "toml" }
    }

    -- avoid conflicting with original config
    local final_opts = vim.tbl_deep_extend("force", opts, preinstalled_langs)

    require("nvim-treesitter.configs").setup(final_opts)

    vim.treesitter.language.register("markdown", "mdx")
  end,
}
