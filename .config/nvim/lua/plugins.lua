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

    require('plugins/lsp'),
    require('plugins/autopairs'),
    require('plugins/surround'),
    require('plugins/nvim-tree'),
    require('plugins/telescope'),
    require('plugins/treesitter'),
    require('plugins/lualine'),
    require('plugins/harpoon'),
    require('plugins/whichkey'),
    require('plugins/noice'),
    "folke/flash.nvim",
    "voldikss/vim-floaterm",
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

require('plugins/set-colorscheme')

