local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local lazy  = require('lazy')

local plugins = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'ray-x/lsp_signature.nvim',
    'windwp/nvim-autopairs',
    'kyazdani42/nvim-web-devicons',
    {                        -- file tree
        'kyazdani42/nvim-tree.lua',
        dependencies = {
            'kyazdani42/nvim-web-devicons'
        },
    },
    {
        "folke/trouble.nvim",
        dependencies = {
            'kyazdani42/nvim-web-devicons'
        },
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        -- or                            , branch = '0.1.x',
        dependencies = {
            {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep'}
        }
    },
    'sharkdp/fd',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/playground',
    "nvim-lualine/lualine.nvim",
    'tanvirtin/monokai.nvim',
    'Mofiqul/dracula.nvim',
    'cpea2506/one_monokai.nvim',
    "EdenEast/nightfox.nvim",
    "sainnhe/sonokai",
    "folke/tokyonight.nvim",
}

lazy.setup(plugins, {})

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

--configure lualine
require('plugin-settings.lualine-settings')

