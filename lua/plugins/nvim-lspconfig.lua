local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')

local on_attach = function(client, buffer)
    lsp_status.register_progress()
    lsp_status.config({
        status_symbol = "LSP ",
        indicator_errors = "E",
        indicator_warnings = "W",
        indicator_info = "I",
        indicator_hint = "H",
        indicator_ok = "O"
    })

    -- local opts = { noremap = true, silent = true, buffer = buffer }

    -- TODO: Set keymaps for lsp service
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.create_Augroup("Format", { clear = true }),
            buffer = buffer,
            callback = function() vim.lsp.buf.format() end
        })
    end
end

require('cmp').setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
    }
})

local servers = {
    'lua_ls',
    'asm_lsp',
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()


for _, lsp in ipairs(servers) do
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    };


    lspconfig[lsp].setup(opts)
end


lspconfig['lua_ls'].setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Force server to recognize vim as a global
                globals = {'vim'},
            }
        }
    }
}
