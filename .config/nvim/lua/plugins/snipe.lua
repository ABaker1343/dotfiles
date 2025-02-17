function ConfigureSnipe ()
    require('snipe').setup {
        ui = {
            position = "center",
            preselect_current = true,
            text_align = "file-first"
        },
        navigage = {
            close_buffer = "d",
            open_split = "x",
            open_vsplit = "v",
        }
    }
end

return 
{
    {
        'leath-dub/snipe.nvim',
        config = ConfigureSnipe
    }
}
