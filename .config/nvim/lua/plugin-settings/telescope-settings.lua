telescope = require('telescope')
builtin = require('telescope.builtin')

-- set some telescope keybinds

vim.keymap.set('n', "<C-f>", builtin.find_files, {})
vim.keymap.set('n', "<leader>fg", builtin.live_grep, {})


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

