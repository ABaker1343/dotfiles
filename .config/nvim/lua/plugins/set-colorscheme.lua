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

    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#cba6f7', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#f2cdcd', bold=true })
end

--local PREFERED_COLORSCHEME = "catppuccin"
local PREFERED_COLORSCHEME = "nordfox"
--local PREFERED_COLORSCHEME = "gruvbox"

local PREFERED_NEOVIDE_COLORSCHEME = ""
local TRANSPARENT_BACKGROUND = false


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

if TRANSPARENT_BACKGROUND then
    vim.cmd [[
        highlight Normal guibg=none
        highlight NonText guibg=none
        highlight NotifyBackground guibg=none
        highlight Normal ctermbg=none
        highlight NonText ctermbg=none
        highlight NotifyBackground ctermbg=none
    ]]
end
