local flash = require('flash')
vim.g.mapleader=' '

-- key remaps
vim.api.nvim_set_keymap("n", "n", "nzzNn", {noremap=true})
vim.api.nvim_set_keymap("n", "G", "Gzz", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>nh", "<cmd>nohl<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "/", "/\\c", {noremap=true})

vim.api.nvim_set_keymap("n", "<C-u>", "<C-y>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-y>", "<C-u>", {noremap = true})

vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>", {noremap = {true}})
--vim.keymap.set('t', "<Esc>", "<C-\\><C-n><CR>", {noremap = {true}})
vim.keymap.set('t', "<C-p>", "<cmd>FloatermPrev<CR>", {noremap = true});
vim.keymap.set('t', "<C-n>", "<cmd>FloatermNext<CR>", {noremap = true});
vim.keymap.set('t', "<C-k>", "<cmd>FloatermKill<CR>", {noremap = true});

--vim.keymap.set('n', "s", "<Plug>(leap-forward)", {noremap = true});
--vim.keymap.set('n', "S", "<Plug>(leap-backward)", {noremap = true});

vim.keymap.set('n', "s", flash.jump, {noremap = true});

if vim.g.neovide then
    -- NEOVIDE_CURRENT_FONT_SIZE defined in settings.lua
    function zoom(delta)
      NEOVIDE_CURRENT_FONT_SIZE = NEOVIDE_CURRENT_FONT_SIZE + delta;
      vim.o.guifont = "InconsolataGo Nerd Font Mono:h" .. tostring(NEOVIDE_CURRENT_FONT_SIZE) .. ":b"
    end

    vim.keymap.set('n', "<C-=>", function() zoom(2) end, {noremap = {true}})
    vim.keymap.set('n', "<C-->", function() zoom(-2) end, {noremap = {true}})
end


