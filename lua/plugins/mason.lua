local opts = {
    ensure_installed = {
        'lua_ls',
        'clangd',
        'jdtls',

    }
}

require('mason').setup()
require('mason-lspconfig').setup(opts)
