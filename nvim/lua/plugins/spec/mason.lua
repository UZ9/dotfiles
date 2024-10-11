---@type LazyPluginSpec
return {
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

      -- C++ specific
      "clangd",
      "clang-format",
      "cmake-language-server",
      "cpptools",

      -- Rust specific
      "rust-analyzer",

      -- Shell checks
      "shellcheck",

      -- YAML
      "yamlfix",
      "yaml-language-server",
    },
  },
}
