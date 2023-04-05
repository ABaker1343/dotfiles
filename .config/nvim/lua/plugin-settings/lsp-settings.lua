local lspconfig = require('lspconfig')

lspconfig.clangd.setup {}
lspconfig.gopls.setup {}
lspconfig.sumneko_lua.setup {}
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

lspconfig.ltex.setup {
    settings = {
        ltex = {
            language = "en-GB",
        },
    },
}


