local opts = {
    ensure_installed = {
        'lua_ls'
    }
}

require('mason').setup()
require('mason-lspconfig').setup(opts)
