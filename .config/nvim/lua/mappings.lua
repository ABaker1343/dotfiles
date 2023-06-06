vim.g.mapleader=' '

-- key remaps
vim.api.nvim_set_keymap("n", "n", "nzzNn", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>nh", ":nohl<CR>", {noremap=true})

vim.api.nvim_set_keymap("n", "<C-u>", "<C-y>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-y>", "<C-u>", {noremap = true})

vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>sh", ":split<CR>", {noremap=true})

vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>tl", ":tabn<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>th", ":tabp<CR>", {noremap=true})

-- nvim tree mappings
vim.api.nvim_set_keymap("n", "<C-t>", ":NvimTreeToggle<CR>", {})

-- color scheme mappings
vim.api.nvim_set_keymap("n", "<C-c>", ":colors sonokai<CR>", {})

-- telescope mappings
local telescopeFuncs = require('telescope.builtin')
vim.keymap.set('n', "<C-f>", telescopeFuncs.find_files, {})
vim.keymap.set('n', "<leader>fg", telescopeFuncs.live_grep, {})
vim.keymap.set('n', "<leader>ff", telescopeFuncs.find_files, {})
--vim.keymap.set('n', "<leader>fb", telescopeFuncs.file_browser, {})
vim.keymap.set('n', "<leader>fb", ":Telescope file_browser<CR>", {noremap = true})

vim.keymap.set('n', "gr", telescopeFuncs.lsp_references, {})
vim.keymap.set('n', "gi", telescopeFuncs.lsp_implementations, {})
vim.keymap.set('n', "gd", telescopeFuncs.lsp_definitions, {})
vim.keymap.set('n', "<leader>le", telescopeFuncs.diagnostics, {})
vim.keymap.set('n', "<leader>lt", telescopeFuncs.treesitter, {noremap = true})

-- harpoon mappings
local harpoonUI = require('harpoon.ui')
local harpoonMark = require('harpoon.mark')

vim.keymap.set('n', "<leader>ha", harpoonMark.add_file, {noremap = false})
vim.keymap.set('n', "<leader>hl", harpoonUI.nav_next, {noremap = false})
vim.keymap.set('n', "<leader>hh", harpoonUI.nav_prev, {noremap = false})
vim.keymap.set('n', "<leader>hm", harpoonUI.toggle_quick_menu, {noremap = false})

-- neovide specific mappings
if vim.g.neovide then
    vim.keymap.set('n', "<S-Insert>", "<C-R>+", {noremap = true})
end
