function ConfigureBlankline ()
    local blankline = require("ibl")
    blankline.setup()
end

return
{
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
        config = ConfigureBlankline
    },
}
