vim.g.mapleader=' '

-- key remaps
vim.api.nvim_set_keymap("n", "n", "nzzNn", {noremap=true})
vim.api.nvim_set_keymap("n", "G", "Gzz", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>nh", "<cmd>nohl<CR>", {noremap=true})

vim.api.nvim_set_keymap("n", "<C-u>", "<C-y>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-y>", "<C-u>", {noremap = true})

vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>", {noremap = {true}})
--vim.keymap.set('t', "<Esc>", "<C-\\><C-n><CR>", {noremap = {true}})
vim.keymap.set('t', "<C-p>", "<cmd>FloatermPrev<CR>", {noremap = true});
vim.keymap.set('t', "<C-n>", "<cmd>FloatermNext<CR>", {noremap = true});
vim.keymap.set('t', "<C-k>", "<cmd>FloatermKill<CR>", {noremap = true});
