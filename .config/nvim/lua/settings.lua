vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 10

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.splitright = true

vim.opt.linebreak = true

vim.opt.cursorline = false
vim.opt.cursorcolumn = false

--vim.opt.guicursor="n-v-c:block,i:block"
vim.opt.guicursor="n-v-c:block,i:ver36"

vim.opt.timeoutlen = 10000

--NEOVIDE_FONT = "JetBrainsMono"
--NEOVIDE_FONT = "MonaspiceAr NF"
--NEOVIDE_FONT = "Mononoki Nerd Font"
--NEOVIDE_FONT = "0xProto Nerd Font Mono"
--NEOVIDE_FONT = "Source Code Pro"
--NEOVIDE_FONT = "FiraMono Nerd Font"
--NEOVIDE_FONT = "monospace"
--NEOVIDE_CURRENT_FONT_SIZE = 14
--NEOVIDE_FONT = "Monofur Nerd Font"
--NEOVIDE_CURRENT_FONT_SIZE = 16

--NEOVIDE_FONT = { font = "Monofur Nerd Font", size = 18 }
NEOVIDE_FONT = { font = "Hack Nerd Font", size = 16 }

NEOVIDE_FONT_BOLD = false

if vim.g.neovide then
    if NEOVIDE_FONT_BOLD then
        vim.o.guifont=NEOVIDE_FONT.font .. ":h".. tostring(NEOVIDE_FONT.size) .. ":b"
    else
        --vim.o.guifont=NEOVIDE_FONT .. ":h".. tostring(NEOVIDE_CURRENT_FONT_SIZE)
        vim.o.guifont=NEOVIDE_FONT.font .. ":h".. tostring(NEOVIDE_FONT.size)
    end
    vim.g.neovide_remember_window_size = false
    --vim.g.neovide_transparency = 0.8
end

vim.cmd[["set wrap smoothscroll"]]
