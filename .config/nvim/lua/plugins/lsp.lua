function ConfigureLsp ()
    local lspconfig = require('lspconfig')

    lspconfig.clangd.setup {
        --arguments = {
            --"--header-insertion=never",
            --"--limit-references=100",
            --"--limit-results=20",
        --}
        cmd = {
            "clangd",
            "--clang-tidy",
            "--header-insertion=never",
            "--background-index",
            "--pch-storage=memory",
            "--limit-references=50",
            "--limit-results=50"
        }
    }

    lspconfig.gopls.setup {}

    lspconfig.lua_ls.setup {}

    lspconfig.pyright.setup {}

    lspconfig.texlab.setup {}

    lspconfig.glslls.setup {
        cmd = {
            "glslls", "--stdin",
        },
        filetypes = {
            "glsl",
            "vert",
            "frag",
        }
    }

    lspconfig.rust_analyzer.setup {}

    lspconfig.ltex.setup {
        enabled = {
            { "bib", "gitcommit", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "html", "xhtml", "mail", "text" }
        }
    }

    --markdown lsp
    lspconfig.marksman.setup {}

    --typescript-language-server
    lspconfig.ts_ls.setup {}

    --css-languageserver
    lspconfig.cssls.setup {}

    -- godot script
    lspconfig.gdscript.setup {}
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
