function ConfigureTelescope ()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    -- set some telescope keybinds

    telescope.setup {
        defaults = {
            sorting_stategy = "ascending",
            mappings = {
                i = {
                    ["<C-h>"] = "which_key",
                },
            },
            layout_config = {
                prompt_position = 'top',
                horizontal = {width = 0.8},
            },
            file_ignore_patterns = {
              "build/",
              "debug/"
            }
        },

        pickers = {
            find_files = {
                theme="dropdown"
            },
        },

    }

    telescope.load_extension("file_browser")
end

return
{
    {
        'nvim-telescope/telescope.nvim',
        lazy = false,
        config = ConfigureTelescope,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'nvim-telescope/telescope-file-browser.nvim',
        }
    },
}
