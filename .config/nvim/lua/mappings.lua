vim.g.mapleader=' '

-- key remaps
vim.api.nvim_set_keymap("n", "n", "nzzNn", {noremap=true})

-- nvim tree mappings
vim.api.nvim_set_keymap("n", "<C-t>", ":NvimTreeToggle<CR>", {})

-- color scheme mappings
vim.api.nvim_set_keymap("n", "<C-c>", ":colors sonokai<CR>", {})

-- telescope mappings
telescopeFuncs = require('telescope.builtin')
vim.keymap.set('n', "<C-f>", telescopeFuncs.find_files, {})
vim.keymap.set('n', "<leader>fg", telescopeFuncs.live_grep, {})
vim.keymap.set('n', "<leader>ff", telescopeFuncs.find_files, {})
--vim.keymap.set('n', "<leader>fb", telescopeFuncs.file_browser, {})
vim.keymap.set('n', "<leader>fb", ":Telescope file_browser<CR>", {noremap = true})

vim.keymap.set('n', "gr", telescopeFuncs.lsp_references, {})
vim.keymap.set('n', "gi", telescopeFuncs.lsp_implementations, {})
vim.keymap.set('n', "gd", telescopeFuncs.lsp_definitions, {})
vim.keymap.set('n', "<leader>le", telescopeFuncs.diagnostics, {})
