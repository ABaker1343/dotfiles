vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.splitright = true

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

--vim.opt.guicursor="n-v-c:block,i:blinkwait500-blinkon250-blinkoff120-hor55"
vim.opt.guicursor="n-v-c:block,i:block"

vim.api.nvim_set_keymap("n", "<C-t>", ":NvimTreeToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope find_files<CR>", {})
vim.api.nvim_set_keymap("n", "<C-c>", ":colors monokai<CR>", {})
