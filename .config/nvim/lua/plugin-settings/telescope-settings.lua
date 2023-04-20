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

        },
    },

}

telescope.load_extension("file_browser")

