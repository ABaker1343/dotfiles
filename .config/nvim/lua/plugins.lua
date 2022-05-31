local packer = require('packer')
packer.startup(function()
    packer.use 'neovim/nvim-lspconfig' -- languager server

    packer.use 'hrsh7th/cmp-nvim-lsp' -- completion from lsp
    packer.use 'hrsh7th/nvim-cmp' -- completion plugin

    packer.use 'L3MON4D3/LuaSnip' -- snippet engine

    packer.use 'ray-x/lsp_signature.nvim' -- for function signitures

    packer.use 'windwp/nvim-autopairs' -- autopairing some characters

    packer.use 'kyazdani42/nvim-web-devicons'
    packer.use {                        -- file tree
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons'
        },
    }
end)

--configure the lsp

local lspconfig = require('lspconfig')

lspconfig.ccls.setup {}
lspconfig.gopls.setup {}

-- configure cmp

local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    {
        { name = 'buffer' },
    }),

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<TAB>'] = cmp.mapping.confirm({ select = true }), -- Accept cur
    }),
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- configure function signitures

local lspsig = require('lsp_signature')
lspsig.setup({})

-- configure autopair

require('nvim-autopairs').setup{}


-- configure the nvim filetree

tree = require('nvim-tree')

tree.setup()

