require('material').setup({})

vim.g.sonokai_style = 'atlantis'
--vim.g.material_style = 'oceanic'
--vim.g.material_style = 'deep ocean'
vim.g.material_style = "palenight"
--vim.g.material_style = "darker"
vim.g.modus_termtrans_enable=0
vim.o.background = "dark"

vim.o.termguicolors = true;

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

-- vim.o.background = "light"
--local PREFERED_COLORSCHEME = "mbc"
--local PREFERED_NEOVIDE_COLORSCHEME = "darkvoid"
--local PREFERED_NEOVIDE_COLORSCHEME = "kanagawa-wave"
--local PREFERED_NEOVIDE_COLORSCHEME = "gruvbox"
--local PREFERED_NEOVIDE_COLORSCHEME = "nordfox"
--local PREFERED_NEOVIDE_COLORSCHEME = "monokai_pro"
--local PREFERED_NEOVIDE_COLORSCHEME = "material"

local PREFERED_COLORSCHEME = "catppuccin"
local PREFERED_NEOVIDE_COLORSCHEME = ""


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

