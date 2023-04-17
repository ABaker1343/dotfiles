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

lspconfig.ltex.setup {}
