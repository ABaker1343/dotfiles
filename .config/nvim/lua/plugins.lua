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
    packer.use 'sharkdp/fd'

    packer.use 'nvim-treesitter/nvim-treesitter'
    packer.use 'nvim-treesitter/nvim-treesitter-context'
    packer.use 'nvim-treesitter/playground'

    -- colorscheme monokai
    packer.use 'tanvirtin/monokai.nvim'
    packer.use 'Mofiqul/dracula.nvim'
    packer.use 'cpea2506/one_monokai.nvim'
    packer.use "EdenEast/nightfox.nvim"
end)

-- configure lsp
require('plugin-settings.lsp-settings')

-- configure cmp
require('plugin-settings.completion-settings')

-- configure function signitures
require('plugin-settings.func-signiture-settings')

-- configure autopair
require('plugin-settings.autopair-settings')

-- configure the nvim filetree
require('plugin-settings.nvim-tree-settings')

-- set up trouble plugin
require('plugin-settings.trouble-settings')

-- set up treesitter
require('plugin-settings.treesitter-settings')

-- configure colorscheme
require('plugin-settings.colorscheme-settings')

-- configure telescope
require('plugin-settings.telescope-settings')

