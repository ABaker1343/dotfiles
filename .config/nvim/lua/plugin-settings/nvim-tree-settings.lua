tree = require('nvim-tree')

tree.setup {
    view = {
        side = "left",
        adaptive_size = false,
    },
    renderer = {
        add_trailing = true,
        highlight_opened_files = "all",
    }
}
