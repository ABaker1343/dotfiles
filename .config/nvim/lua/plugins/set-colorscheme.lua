require('material').setup({})

vim.g.sonokai_style = 'atlantis'
vim.g.material_style = 'deep ocean'
vim.g.material_style = "palenight"
vim.g.modus_termtrans_enable=0
vim.o.background = "dark"


vim.o.termguicolors = true;
--vim.cmd[[colorscheme abscs]]
--vim.cmd[[colorscheme nordfox]]
--vim.cmd[[colorscheme material]]
--vim.cmd[[colorscheme kanagawa]]
--vim.cmd[[colorscheme tokyonight-night]]
--vim.cmd[[colorscheme sonokai]]
--vim.cmd[[colorscheme nvimgelion]]
--vim.cmd[[colorscheme dracula]]
--vim.cmd [[colorscheme PaperColor]]
--vim.cmd [[colorscheme zephyr]]
--vim.cmd [[colorscheme embark]]
--vim.cmd [[colorscheme melange]]
--vim.cmd[[colorscheme modus-vivendi]]
--vim.cmd[[colorscheme kanagawa-wave]]
--vim.cmd [[colorscheme nordic]]
--vim.cmd[[colorscheme colors-wal]]
--vim.cmd[[colorscheme mbc]] -- wal colors


-- fav colorschemes
--
--vim.cmd[[colorscheme monokai_pro]]
--vim.cmd[[colorscheme gruvbox]]
--vim.cmd[[colorscheme kanagawa-dragon]]
--vim.cmd[[colorscheme catppuccin-mocha]]
--vim.cmd[[colorscheme material-darker]]
--vim.cmd[[colorscheme mbc]] -- wal colors
--vim.cmd[[colorscheme kanagawa]]

local function SetWalColors ()
    vim.cmd[[highlight Normal ctermbg=none]]
    vim.cmd[[highlight NonText ctermbg=none]]
    vim.cmd[[highlight Normal guibg=none]]
    vim.cmd[[highlight Normal guibg=none]]

    vim.cmd[[colorscheme mbc]] -- wal colors
end

local function SetColorscheme(colorscheme)
    local command = "colorscheme " .. colorscheme
    local ok, _ = pcall(vim.cmd, command)
    if not ok then
	vim.cmd 'colorscheme default'
    end
end

local PREFERED_COLORSCHEME = "nordic"

if not vim.g.neovide then
    --SetWalColors()
    SetColorscheme(PREFERED_COLORSCHEME)
else
    SetColorscheme(PREFERED_COLORSCHEME)
end
