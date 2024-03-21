local opts = {
    ensure_installed = {
        'lua_ls',
        'clangd',

    }
}

require('mason').setup()
require('mason-lspconfig').setup(opts)
