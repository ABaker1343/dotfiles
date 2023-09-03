vim.g.mapleader=' '

-- key remaps
vim.api.nvim_set_keymap("n", "n", "nzzNn", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>nh", ":nohl<CR>", {noremap=true})

vim.api.nvim_set_keymap("n", "<C-u>", "<C-y>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-y>", "<C-u>", {noremap = true})

vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>", {noremap = {true}})
