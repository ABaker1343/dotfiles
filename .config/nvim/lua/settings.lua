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

vim.opt.guicursor="n-v-c:block,i:block"

NEOVIDE_FONT = "InconsolataGo Nerd Font Mono"
NEOVIDE_CURRENT_FONT_SIZE = 16

if vim.g.neovide then
    vim.o.guifont=NEOVIDE_FONT .. ":h".. tostring(NEOVIDE_CURRENT_FONT_SIZE) .. ":b"
    vim.g.neovide_remember_window_size = false
    --vim.g.neovide_transparency = 0.8
end

vim.cmd[["set wrap smoothscroll"]]
