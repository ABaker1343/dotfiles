local lspconfig = require('lspconfig')

lspconfig.clangd.setup {}

lspconfig.gopls.setup {}

lspconfig.lua_ls.setup {}

lspconfig.pyright.setup {}

--markdown lsp
lspconfig.marksman.setup {}

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

lspconfig.ltex.setup {}

--typescript-language-server
lspconfig.tsserver.setup {}

--css-languageserver
lspconfig.cssls.setup {}
