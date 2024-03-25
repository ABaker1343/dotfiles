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
        layout_config = {
            prompt_position = 'top',
            horizontal = {width = 0.8},
        },
    },

    pickers = {
        find_files = {

        },
    },

}

telescope.load_extension("file_browser")

