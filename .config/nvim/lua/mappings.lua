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

-- neovide zoom mappings

local current_font_size = 12
function zoom(delta)
  current_font_size = current_font_size + delta;
  vim.o.guifont = "InconsolataGo Nerd Font Mono:h" .. tostring(current_font_size) .. ":b"
end

vim.keymap.set('n', "<C-=>", function() zoom(2) end, {noremap = {true}})
vim.keymap.set('n', "<C-->", function() zoom(-2) end, {noremap = {true}})
