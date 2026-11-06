function ConfigureLsp ()
    local lspconfig = require('lspconfig')
    vim.lsp.enable("clangd")
    vim.lsp.enable("rust_analyzer")
    vim.lsp.enable("ols")
end

function ConfigureSignature()
    local lsp_sig = require("lsp_signature")

    local config = {

    }

    lsp_sig.setup()
end

return
{
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = ConfigureLsp,
        dependencies = {
            require('plugins/completion'),
            require('plugins/func-signature')
        }
    },
    {
        "ray-x/lsp_signature.nvim",
        config = ConfigureSignature
    }

}
