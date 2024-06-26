-- install lazy nvim if not already installed
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

-- list all plugins
local plugins = {

    -- lsp
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('plugin-settings.lsp-settings')
        end,
        dependencies = {
            {
                'hrsh7th/nvim-cmp',
                config = function()
                    require('plugin-settings.completion-settings')
                end,
                dependencies = {
                    'hrsh7th/cmp-nvim-lsp',
                    'hrsh7th/cmp-cmdline',
                    'hrsh7th/cmp-path',
                    --'hrsh7th/cmp-buffer',
                }
            },
            {
                'ray-x/lsp_signature.nvim',
                config = function ()
                    require('plugin-settings.func-signiture-settings')
                end,
            },
        }
    },

    -- autoparis
    {
        'windwp/nvim-autopairs',
        config = function()
            require('plugin-settings.autopair-settings')
        end,
    },

    -- surround support
    {
        "kylechui/nvim-surround",
        config = function()
            require('nvim-surround').setup {}
        end
    },

    -- nvim filetree
    {
        'kyazdani42/nvim-tree.lua',
        config = function ()
            require('plugin-settings.nvim-tree-settings')
        end,
        dependencies = {
            'kyazdani42/nvim-web-devicons'
        },
    },

    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('plugin-settings.telescope-settings')
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'nvim-telescope/telescope-file-browser.nvim',
        }
    },

    -- treesitter for parsing language files
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require("plugin-settings.treesitter-settings")
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context',
        }
    },
    --'nvim-treesitter/playground',

    -- lualine for a nice bar at the bottom
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require('plugin-settings.lualine-settings')
        end,
    },

    -- harpoon for fast file switching
    {
        'ThePrimeagen/harpoon',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },

    --{
        --"ggandor/leap.nvim",
    --},
    {
        "folke/flash.nvim"
    },

    -- which key to show key mappings
    {
        "folke/which-key.nvim",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require('plugin-settings.which-key-settings')
        end,
    },

    -- nice nvim
    {
      "folke/noice.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
      init = function()
        require('plugin-settings.noice-settings')
      end,
      config = function()
      end,
    },

    -- floating terminal
    {
        "voldikss/vim-floaterm",
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
    'Abstract-IDE/Abstract-cs',
    "rebelot/kanagawa.nvim",
    "savq/melange-nvim",
    'NLKNguyen/papercolor-theme',
    { "catppuccin/nvim", name = "catppuccin" },
    { 'embark-theme/vim', name = 'embark' },
    "AlexvZyl/nordic.nvim",
    'ishan9299/modus-theme-vim',
    "ellisonleao/gruvbox.nvim",
    "mbrea-c/wal-colors.nvim"
}

lazy.setup(plugins, {})

require('plugin-settings.colorscheme-settings')

