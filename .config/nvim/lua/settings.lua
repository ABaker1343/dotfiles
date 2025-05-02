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

--NEOVIDE_FONT = { font = "Monofur Nerd Font", size = 18 }
--NEOVIDE_FONT = { font = "Hack Nerd Font", size = 16 }
--NEOVIDE_FONT = { font = "Adwaita Mono", size = 16 }

local NEOVIDE_FONT = { font = "", size = 16 }

font_file_path = os.getenv("HOME") .. "/.config/nvim/prefered_font"
local font_file = io.open(font_file_path)

if not font_file then
    NEOVIDE_FONT.font = "monospace"
else
    NEOVIDE_FONT.font = font_file:read("*a")
    NEOVIDE_FONT.font = string.gsub(NEOVIDE_FONT.font, '\n', "")
    font_file.close()
end

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
