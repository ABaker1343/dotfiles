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

    packer.use {
        "folke/trouble.nvim",
        requires = {
            'kyazdani42/nvim-web-devicons'
        },
    }

    packer.use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    packer.use 'nvim-treesitter/nvim-treesitter'
    packer.use 'nvim-treesitter/nvim-treesitter-context'
end)

--configure the lsp

local lspconfig = require('lspconfig')

--lspconfig.ccls.setup {}
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

lspconfig.ltex.setup {}

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

tree.setup {
    view = {
        side = "left",
        adaptive_size = false,
    },
    renderer = {
        add_trailing = true,
        highlight_opened_files = "all",
    }
}

-- set up trouble plugin

trouble = require("trouble")
trouble.setup {

}

-- set up treesitter
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
            'interface',
            'struct',
            'enum',
        },
        -- Patterns for specific filetypes
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        tex = {
            'chapter',
            'section',
            'subsection',
            'subsubsection',
        },
        haskell = {
            'adt'
        },
        rust = {
            'impl_item',

        },
        terraform = {
            'block',
            'object_elem',
            'attribute',
        },
        scala = {
            'object_definition',
        },
        vhdl = {
            'process_statement',
            'architecture_body',
            'entity_declaration',
        },
        markdown = {
            'section',
        },
        elixir = {
            'anonymous_function',
            'arguments',
            'block',
            'do_block',
            'list',
            'map',
            'tuple',
            'quoted_content',
        },
        json = {
            'pair',
        },
        typescript = {
            'export_statement',
        },
        yaml = {
            'block_mapping_pair',
        },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
}
