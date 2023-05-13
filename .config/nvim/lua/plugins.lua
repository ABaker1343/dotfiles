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
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('plugin-settings.lsp-settings')
        end,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            {
                'hrsh7th/nvim-cmp',
                config = function()
                    require('plugin-settings.completion-settings')
                end,
            },
            {
                'ray-x/lsp_signature.nvim',
                config = function ()
                    require('plugin-settings.func-signiture-settings')
                end,
            }
        }
    },

    {
        'windwp/nvim-autopairs',
        config = function()
            require('plugin-settings.autopair-settings')
        end,
    },
    'kyazdani42/nvim-web-devicons',
    {
    'kyazdani42/nvim-tree.lua',
    config = function ()
        require('plugin-settings.nvim-tree-settings')
    end,
    dependencies = {
        'kyazdani42/nvim-web-devicons'
    },
},
{
    "folke/trouble.nvim",
    config = function()
        require('plugin-settings.trouble-settings')
    end,
    dependencies = {
        'kyazdani42/nvim-web-devicons'
    },
},
{
    'nvim-telescope/telescope-file-browser.nvim',
    config = function()
        require('plugin-settings.telescope-settings')
    end,
    dependencies = {
        {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep'}
    }
},
'sharkdp/fd',
{
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require("plugin-settings.treesitter-settings")
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
    }
},
'nvim-treesitter/playground',
{
    "nvim-lualine/lualine.nvim",
    config = function()
        require('plugin-settings.lualine-settings')
    end,
},
{
    'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim'
    }
},
-- debug adpater
'mfussenegger/nvim-dap',
-- colorschemes
'tanvirtin/monokai.nvim',
'Mofiqul/dracula.nvim',
'cpea2506/one_monokai.nvim',
"EdenEast/nightfox.nvim",
"sainnhe/sonokai",
"folke/tokyonight.nvim",
"nyngwang/nvimgelion",
'glepnir/zephyr-nvim',
'marko-cerovac/material.nvim',
{ "catppuccin/nvim", name = "catppuccin" },
{ 'embark-theme/vim', name = 'embark' },
}

lazy.setup(plugins, {})

require('plugin-settings.colorscheme-settings')

