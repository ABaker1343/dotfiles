require('material').setup({})

vim.g.sonokai_style = 'atlantis'
--vim.g.material_style = 'oceanic'
--vim.g.material_style = 'deep ocean'
vim.g.material_style = "palenight"
--vim.g.material_style = "darker"
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

-- Sets colors to line numbers Above, Current and Below  in this order
function SetLineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
end

local PREFERED_COLORSCHEME = ""
local PREFERED_NEOVIDE_COLORSCHEME = ""

-- vim.o.background = "light"
--local PREFERED_COLORSCHEME = "mbc"
--local PREFERED_NEOVIDE_COLORSCHEME = "darkvoid"
--local PREFERED_NEOVIDE_COLORSCHEME = "kanagawa-wave"
--local PREFERED_NEOVIDE_COLORSCHEME = "gruvbox"
--local PREFERED_NEOVIDE_COLORSCHEME = "nordfox"
local PREFERED_NEOVIDE_COLORSCHEME = "monokai_pro"
--local PREFERED_NEOVIDE_COLORSCHEME = "material"

if (PREFERED_NEOVIDE_COLORSCHEME == "") then
    PREFERED_NEOVIDE_COLORSCHEME = PREFERED_COLORSCHEME
end


if not vim.g.neovide then
    --SetWalColors()
    SetColorscheme(PREFERED_COLORSCHEME)
    SetLineNumberColors()
else
    SetColorscheme(PREFERED_NEOVIDE_COLORSCHEME)
    SetLineNumberColors()
end

