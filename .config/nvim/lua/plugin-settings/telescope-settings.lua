telescope = require('telescope')
builtin = require('telescope.builtin')

-- set some telescope keybinds

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
            },
        },
    },

    pickers = {
        find_files = {
            theme = "dropdown",
        },
    },

}

telescope.load_extension("file_browser")

vim.keymap.set('n', "<C-f>", builtin.find_files, {})
vim.keymap.set('n', "<leader>fg", builtin.live_grep, {})
vim.keymap.set('n', "<leader>ff", builtin.find_files, {})
--vim.keymap.set('n', "<leader>fb", builtin.file_browser, {})
vim.keymap.set('n', "<leader>fb", ":Telescope file_browser<CR>", {noremap = true})

