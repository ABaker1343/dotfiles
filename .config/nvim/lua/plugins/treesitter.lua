function ConfigureTreesitter ()
    local treesitter = require("nvim-treesitter")

    treesitter_list = { "c", "cpp", "python" , "rust"}
    treesitter.install{ "c" , "cpp", "python", "rust"}
    treesitter.install{treesitter_list}

    vim.treesitter.language.register('glsl', 'vert')
    vim.treesitter.language.register('glsl', 'frag')
    vim.treesitter.language.register('tsx', 'typescript')

    for i = 1, #treesitter_list, 1
    do
        vim.api.nvim_create_autocmd(
            'FileType',
            {
                pattern = { treesitter_list[i] },
                callback = function() vim.treesitter.start() end
            }
        )
    end
end

return
{
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context',
        },
        lazy = false,
        build = ":TSUpdate",
        config = ConfigureTreesitter,
        opts = {
            ensure_installed = { 'c', 'c++', 'python'},
            highlight = {
                enable = true
            }
        }
    },
}
