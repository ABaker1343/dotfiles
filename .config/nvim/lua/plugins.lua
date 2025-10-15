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
    require('plugins/lsp'), -- lsp
    require('plugins/treesitter'), -- treesitter
    require('plugins/autopairs'), -- auto bracket pairing
    require('plugins/surround'), -- surround
    require('plugins/nvim-tree'), -- file tree
    require('plugins/telescope'), -- telescope
    require('plugins/lualine'), -- line at the bottom
    require('plugins/harpoon'), -- 
    require('plugins/snipe'),
    --require('plugins/noice'),
    "folke/flash.nvim",
    "voldikss/vim-floaterm",
    --require('plugins/whichkey'),
    --require('plugins/completion'),
    --'mfussenegger/nvim-dap',
    --"sbdchd/neoformat",

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
    "darkvoid-theme/darkvoid.nvim",
    "mbrea-c/wal-colors.nvim"
}

lazy.setup(plugins, {
    spec = {
        {import = "plugins"},
    }
})

require('plugins/set-colorscheme')

