function ConfigureNvimTree ()
    local tree = require('nvim-tree')

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
end

return
{
    {
        'kyazdani42/nvim-tree.lua',
        config = ConfigureNvimTree,
        dependencies = {
            'kyazdani42/nvim-web-devicons'
        },
    },
}
