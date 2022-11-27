vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.splitright = true

vim.opt.cursorline = true

vim.api.nvim_set_keymap("n", "<C-t>", ":NvimTreeToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope find_files<CR>", {})
vim.api.nvim_set_keymap("n", "<C-c>", ":colors monokai<CR>", {})
