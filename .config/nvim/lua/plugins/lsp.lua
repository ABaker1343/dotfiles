function ConfigureLsp ()
    local lspconfig = require('lspconfig')

    lspconfig.clangd.setup {}

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
    lspconfig.tsserver.setup {}

    --css-languageserver
    lspconfig.cssls.setup {}

    -- godot script
    lspconfig.gdscript.setup {}
end

return
{
    {
        'neovim/nvim-lspconfig',
        config = ConfigureLsp,
        dependencies = {
            require('plugins/completion'),
            require('plugins/func-signature')
        }
    }

}
