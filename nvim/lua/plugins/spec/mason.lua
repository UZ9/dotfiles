---@type NvPluginSpec
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
    },
  },
}
